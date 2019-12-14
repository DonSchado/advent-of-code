GUTTER  = 3
VOID    = '.'
ASTROID = '#'
STATION = 'X'

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red;    colorize(31); end
  def green;  colorize(32); end
  def yellow; colorize(33); end
end

def clear; print "\e[H\e[2J"; end


Void = Struct.new(:x, :y) do
  def to_s
    VOID.center(GUTTER)
  end
  alias_method :inspect, :to_s

   def observeable?
    false
  end
end


Astroid = Struct.new(:x, :y) do
  class << self
    attr_accessor :kills
    attr_accessor :best
  end

  @best = {}
  @kills = 0

  attr_accessor :observations, :presentation, :vaporized, :station

  def initialize(x, y)
    @observations = nil
    @presentation = ASTROID
    @vaporized    = false
    @station      = false
    super
  end

  def observeable?
    true
  end

  def angle(other)
    dx     = other.x - x
    dy     = other.y - y
    deg90  = Math::PI/2
    deg360 = Math::PI*2

    radians = Math.atan2(dy, dx)
    radians += deg90  # align that 0 deg is on y axis
    radians %= deg360 # get only positiv angles for sorting (0.0 is min)
  end

  def observe(others)
    self.observations = (others - [self]).group_by { |a| angle(a) }.size
    Astroid.best[observations] = self if observations > Astroid.best.keys.max.to_i
  end

  def manhatten_distance(other)
    (x - other.x).abs + (y - other.y).abs
  end

  def to_s
    presentation.center(GUTTER)
  end

  def inspect
    return to_s unless observations

    if Astroid.best[observations] == self && Astroid.best.keys.max == observations
      "#{observations}".center(GUTTER).green  # current max
    elsif Astroid.best[observations] == self
      "#{observations}".center(GUTTER).yellow # former max
    else
      "#{observations}".center(GUTTER)        # just the count
    end
  end

  def each_vaporizable(astroids)
    Hash[astroids.select(&:vaporizable?).group_by { |a| angle(a) }].sort_by { |k,v| k }.each do |_angle, astroids|
      yield(astroids.min_by { |a| manhatten_distance(a) })
    end
  end

  def vaporize!
    Astroid.kills += 1
    self.presentation = (Astroid.kills == 200 ? '200'.center(GUTTER).yellow : VOID.center(GUTTER).red)
    self.vaporized = true
  end

  def vaporizable?
    !vaporized && !station
  end

  def setup_giant_laser
    self.station = true
    self.presentation = STATION.center(GUTTER).green
  end
end

asteroid_belt = DATA.read.chomp.each_line.each_with_index.each_with_object([]) do |(line, y), belt|
  belt << line.chomp.split('').each_with_index.map { |char, x| char == ASTROID ? Astroid.new(x, y) : Void.new(x, y) }
end

@astroids = asteroid_belt.flatten.select(&:observeable?)

@astroids.each do |astroid|
  astroid.observe(@astroids)
  clear
  puts
  asteroid_belt.each do |row|
    print row.map(&:inspect).join(' ')
    print "\n"
  end
  sleep(0.01)
end
puts


# part 1
station = @astroids.max_by(&:observations)
puts "station position @ (#{station.x}, #{station.y}): #{station.observations}/#{@astroids.size - 1} objects seen"
puts


# part 2
puts 'loading the laser...'
station.setup_giant_laser
sleep(1)

while @astroids.any?(&:vaporizable?)
  station.each_vaporizable(@astroids) do |target|
    target.vaporize!
    clear

    puts "kills: #{Astroid.kills}"
    @target200 = target if Astroid.kills == 200

    asteroid_belt.each do |row|
      print row.map(&:to_s).join(' ')
      print "\n"
    end

    sleep(0.01)
  end
end

puts
puts '200th: multiply its X coordinate by 100 and then add its Y coordinate:'
puts (@target200.x) * 100 + (@target200.y)
puts
puts 'done'
puts

__END__
.###.###.###.#####.#
#####.##.###..###..#
.#...####.###.######
######.###.####.####
#####..###..########
#.##.###########.#.#
##.###.######..#.#.#
.#.##.###.#.####.###
##..#.#.##.#########
###.#######.###..##.
###.###.##.##..####.
.##.####.##########.
#######.##.###.#####
#####.##..####.#####
##.#.#####.##.#.#..#
###########.#######.
#.##..#####.#####..#
#####..#####.###.###
####.#.############.
####.#.#.##########.

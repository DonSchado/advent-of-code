$VERBOSE = nil # no warning for accessing class variables...

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red;    colorize(31); end
  def green;  colorize(32); end
  def yellow; colorize(33); end
end

def clear
  print "\e[H\e[2J"
end

Void = Struct.new(:x, :y) do
  def to_s
    ' . '
  end

   def observeable?
    false
  end
end


Astroid = Struct.new(:x, :y) do
  attr_accessor :observations
  @@best = {}

  def initialize(x, y)
    @observations = nil
    super
  end

  def observeable?
    true
  end

  def angle(other)
    (Math.atan2((x - other.x), (y - other.y))) #
  end

  def observe(others)
    self.observations = others.group_by { |a| angle(a) }.size
    @@best[observations] = self if @@best.keys.max.to_i < observations
  end

  def to_s
    if observations
      if @@best[observations] == self && @@best.keys.max == observations
        "#{observations}".center(3).green
      elsif @@best[observations] == self
        "#{observations}".center(3).yellow
      else
        "#{observations}".center(3)
      end
    else
      ' # '
    end
  end
end

asteroid_belt = DATA.read.chomp.each_line.each.with_index(1).each_with_object([]) do |(line, y), belt|
  belt << line.chomp.split('').each.with_index(1).map { |char, x| char == '#' ? Astroid.new(x, y) : Void.new(x, y) }
end

@astroids = asteroid_belt.flatten.select(&:observeable?)

@astroids.each do |astroid|
  astroid.observe((@astroids - [astroid]))
  clear
  puts
  asteroid_belt.each do |row|
    print row.map(&:to_s).join(' ')
    print "\n"
  end
  sleep(0.01)
end
puts

# part 1
best = @astroids.max_by(&:observations)
puts "best position @ (#{best.x - 1}, #{best.y - 1}): #{best.observations} objects seen"
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

# part 1
class Generation
  def initialize(planet)
    @planet = planet
  end

  def call
    @planet.each_with_index.map do |line, y|
      line.each_with_index.map do |bug, x|
        apply_rules(bug, x, y)
      end
    end
  end

  private

  def count_neighbours(x, y)
    n = @planet[y-1][x  ] if y > 0
    o = @planet[y  ][x+1] if x < 4
    s = @planet[y+1][x  ] if y < 4
    w = @planet[y  ][x-1] if x > 0

    [n,o,s,w].compact.count(1)
  end

  def apply_rules(bug, x, y)
    # An empty space becomes infested with a bug if exactly one or two bugs are adjacent to it.
    return 1 if bug == 0 && [1,2].include?(count_neighbours(x,y))

    # A bug dies (becoming an empty space) unless there is exactly one bug adjacent to it.
    return 0 if bug == 1 && count_neighbours(x,y) != 1

    bug
  end
end

planet_surface = DATA.read.chomp.split("\n").map do |line|
  line.split('').map { |c| c == '#' ? 1 : 0 }
end

patterns = []

0.upto(100) do |min|
  system('clear')
  puts "minute: #{min}"
  planet_surface.each_with_index do |line, y|
    line.each_with_index do |bug, x|
      print bug.zero? ? '.' : '#'
    end
    print "\n"
  end

  if patterns.include?(planet_surface)
    puts "biodiversity_rating:"
    puts planet_surface.flatten.each_with_index.map { |c, i| c.zero? ? 0 : 2**i }.sum
    # => 7543003
    exit
  else
    patterns << planet_surface
    planet_surface = Generation.new(planet_surface).call
    sleep(0.2)
  end
end

# EXAMPLE
# __END__
# ....#
# #..#.
# #..##
# ..#..
# #....

# part 2

# WTF?!

__END__
#....
#...#
##.##
....#
#.##.

require 'matrix'

instructions = DATA.read.chomp.split(', ')

directions = {
  0 => [ 0,-1], # ^
  1 => [ 1, 0], # >
  2 => [ 0, 1], # v
  3 => [-1, 0], # <
}

rotation = 0
start = [0,0]

path = instructions.each_with_object([start]) do |move, path|
  case move
  when /R/ then rotation += 1
  when /L/ then rotation -= 1
  end

  current   = Vector[*path.last]
  direction = Vector[*directions[rotation % 4]]

  steps = 1.upto(move[1..].to_i).map do |n|
    (current + n * direction).to_a
  end

  path.concat(steps)
end

manhattan_distance = ->(a, b) { (a[0] - b[0]).abs + (a[1] - b[1]).abs }

# part 1
puts 'How many blocks away is Easter Bunny HQ?'
puts manhattan_distance[start, path.last]
# => 253

# part 2
puts 'How many blocks away is the first location you visit twice?'
visited_twice     = path.tally.select { |point, count| count == 2 }
first_location, _ = visited_twice.min_by { |point, _| path.index(point) }

puts manhattan_distance[start, first_location]
# => 126


# puts 'map:'
# class String
#   def colorize(color_code)
#     "\e[#{color_code}m#{self}\e[0m"
#   end

#   def red;    colorize(31); end
#   def green;  colorize(32); end
#   def yellow; colorize(33); end
# end

# x_max, _ = path.max_by(&:first)
# x_min, _ = path.min_by(&:first)
# _, y_max = path.max_by(&:last)
# _, y_min = path.min_by(&:last)

# y_min.upto(y_max).each do |y|
#   x_min.upto(x_max).each do |x|
#     if path.include?([x,y])
#       if [x,y] == start
#         print 'S'.green
#       elsif [x,y] == path.last
#         print 'X'.red
#       elsif [x,y] == first_location
#         print '2'.yellow
#       else
#         print '@'
#       end
#     else
#       print '.'
#     end
#   end
#   print "\n"
# end

__END__
L1, L5, R1, R3, L4, L5, R5, R1, L2, L2, L3, R4, L2, R3, R1, L2, R5, R3, L4, R4, L3, R3, R3, L2, R1, L3, R2, L1, R4, L2, R4, L4, R5, L3, R1, R1, L1, L3, L2, R1, R3, R2, L1, R4, L4, R2, L189, L4, R5, R3, L1, R47, R4, R1, R3, L3, L3, L2, R70, L1, R4, R185, R5, L4, L5, R4, L1, L4, R5, L3, R2, R3, L5, L3, R5, L1, R5, L4, R1, R2, L2, L5, L2, R4, L3, R5, R1, L5, L4, L3, R4, L3, L4, L1, L5, L5, R5, L5, L2, L1, L2, L4, L1, L2, R3, R1, R1, L2, L5, R2, L3, L5, L4, L2, L1, L2, R3, L1, L4, R3, R3, L2, R5, L1, L3, L3, L3, L5, R5, R1, R2, L3, L2, R4, R1, R1, R3, R4, R3, L3, R3, L5, R2, L2, R4, R5, L4, L3, L1, L5, L1, R1, R2, L1, R3, R4, R5, R2, R3, L2, L1, L5

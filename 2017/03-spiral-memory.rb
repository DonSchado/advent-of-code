require 'matrix'

# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23  24  25

INPUT = 277678

def calculate_square(limit, square: 1)
  interval = (square..).lazy.select(&:odd?).map { |d| d + 2 }  # 1, 3, 5, 7, 9, 11, ...

  square = interval.next until square * square >= limit
  square
end

square = calculate_square(INPUT)
# => 527

# v
# L1
# L1 L2 L2 L3
# L3 L4 L4 L5
# L5 L6 L6 L7
# L7 L8 L8 L9
moves = 1.upto(square).flat_map { |n| [n] * 2 }

directions = {
  0 => [ 0,-1], # ^
  1 => [ 1, 0], # >
  2 => [ 0, 1], # v
  3 => [-1, 0], # <
}

rotation    = 2
counter     = (1..).lazy
access_port = [0, 0, counter.next]

path = moves.each_with_object([access_port]) do |move, path|
  rotation -= 1
  current   = Vector[*path.last[0..1]]
  direction = Vector[*directions[rotation % 4]]

  steps = 1.upto(move).map do |step|
    (current + step * direction).to_a << counter.next
  end

  path.concat(steps)
end

manhattan_distance = ->(a, b) { (a[0] - b[0]).abs + (a[1] - b[1]).abs }

data_square = path.find { |_x, _y, counter| counter == INPUT }

# part 1
puts 'How many steps are required to carry the data?'
puts manhattan_distance.call(data_square, access_port)
# => 475

# part 2
puts 'What is the first value written that is larger than your puzzle input?'

def neighbours(point)
  x, y, *_ = point

  # [
  #   [x-1, y-1], [x, y-1], [x+1, y-1],
  #   [x-1, y  ],           [x+1, y  ],
  #   [x-1, y+1], [x, y+1], [x+1, y+1],
  # ]

  [x-1, x, x+1].product([y-1, y, y+1]) # does the same, but includes the point too
end

# point = [x, y, count, value]
path.each do |point|
  # sum all _values_ from neighbours with smaller count and distance 1
  sum = path.select { |x, y, count, _value| count < point[2] && neighbours(point).include?([x, y]) }
            .map(&:last)
            .sum

  if sum.zero? # just the first 2 ones
    point[3] = 1
  else
    point[3] = sum
  end

  if sum >= INPUT
    puts sum
    exit
  end
end
# => 279138

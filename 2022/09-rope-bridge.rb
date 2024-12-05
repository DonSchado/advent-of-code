motions_moves = DATA.readlines

require 'matrix'

DIRECTIONS = {
  'R' => [0 , 1],
  'U' => [-1, 0],
  'L' => [0 ,-1],
  'D' => [1 , 0],
}

def resolve_path(current, direction, steps)
  path = []
  step = 1

  until path.size == steps
    path += (Matrix[current] + Matrix[DIRECTIONS[direction]] * step).to_a
    step += 1
  end

  path
end


head_path = [[4,0]]

motions_moves.each do |move|
  direction, steps = move.split(' ')
  head = head_path.last

  head_path += resolve_path(head, direction, steps.to_i)
end

p head_path

def manhatten_distance(a, b)
  a1, a2 = a
  b1, b2 = b

  (a1 - b1).abs + (a2 - b2).abs
end


tail_path = [[4,0]]

head_path.each_with_index do |head_step, i|
  # next if tail_path.last == head_step

  # require 'pry'; binding.pry if head_step == [3,4]
  if tail_path.last[0] != head_step[0] || tail_path.last[1] != head_step[1]
    if manhatten_distance(tail_path.last, head_step) > 2
      tail_path << head_path[i-1]
    end
  end
end


(0..4).each do |y|
  (0..5).each do |x|
    print head_path.include?([y,x]) ? 'H' : '.'
  end
  puts
end

puts

(0..4).each do |y|
  (0..5).each do |x|
    print tail_path.include?([y,x]) ? 'T' : '.'
  end
  puts
end

p tail_path.uniq.size


# L 3
# D 1
# R 4
# D 1
# L 5
# R 2


__END__
R 4
U 4

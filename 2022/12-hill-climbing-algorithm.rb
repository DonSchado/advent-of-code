heightmap = DATA.readlines(chomp: true).map { _1.split('') }

def find_position(heightmap, character)
  heightmap.each_with_index.find do |row, y|
    row.include?(character)
  end.then { |x, y| [y, x.index(character)] }
end

def neighbors(heightmap, position)
  y, x = position
  reachable_height = HEIGHTS.index(heightmap[y][x]) + 1

  [
    [y, x+1], # right
    [y, x-1], # left
    [y+1, x], # down
    [y-1, x], # up
  ].map do |direction_y, direction_x|
    next unless direction_y.between?(0, heightmap.size - 1)
    next unless direction_x.between?(0, heightmap.first.size - 1)

    if (char = heightmap[direction_y][direction_x])
      if HEIGHTS.index(char) <= reachable_height
        [direction_y, direction_x]
      end
    end
  end.compact
end

current_position = find_position(heightmap, 'S')
signal_position = find_position(heightmap, 'E')
HEIGHTS = ['S', *('a'..'z').to_a, 'E']

p start: current_position
p end: signal_position
# p heightmap

def bfs(heightmap, start, goal, queue = [], distances = {})
  queue << start
  distances[start] = 0

  until queue.empty?
    position = queue.shift
    break distances if position == goal

    neighbors(heightmap, position).each do |neighbor|
      if distances[neighbor].nil? || distances[neighbor] > distances[position] + 1
        queue << neighbor
        distances[neighbor] = distances[position] + 1
      end
    end
  end
end

p result = bfs(heightmap, current_position, signal_position)

# heightmap.each_with_index do |row, y|
#   row.each_with_index do |col, x|
#     print col
#   end
#   puts
# end

__END__
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi

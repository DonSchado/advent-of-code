
def parse(claim)
  claim.match(/(?<id>\d+)\s@\s(?<x>\d+),(?<y>\d+):\s(?<width>\d+)x(?<height>\d+)/)
       .named_captures
       .values_at('id', 'x', 'y', 'width', 'height')
       .map(&:to_i)
end

claims = DATA.readlines(chomp: true).map(&method(:parse))

coords = claims.each_with_object({}) do |(id, x, y, width, height), memo|
  memo[id] ||= []

  width.times do |w|
    height.times do |h|
      memo[id] << [x + w, y + h]
    end
  end
end

# part 1
puts 'How many square inches of fabric are within two or more claims?'
square_inches = coords.values.flatten(1).tally.reduce(0) do |memo, (coord, count)|
  memo += 1 if count > 1
  memo
end

puts square_inches
# 104439

# part 2
puts "What is the ID of the only claim that doesn't overlap?"


__END__
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2

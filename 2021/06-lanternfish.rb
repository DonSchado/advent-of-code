input = DATA.read.split(",").map(&:to_i)

population = input.dup
days = (1..80)

days.each do |day|
  population = population.map do |fish|
    fish > 0 ? fish - 1 : 6
  end

  break if day == days.max
  population = (population + ([9] * population.count(0)))
end

puts 'How many lanternfish would there be after 80 days?'
puts population.size # => 362639
puts


# > you only need an array with 9 elements to solve part 2.
counts = input.tally
population = Array.new(9) { 0 }

population.each_index do |index|
  population[index] = counts[index] || 0
end

(1..256).each do |day|
  population.rotate!(1)
  population[6] += population.last
end

puts 'How many lanternfish would there be after 256 days?'
puts population.sum
# 1639854996917

__END__
2,1,2,1,5,1,5,1,2,2,1,1,5,1,4,4,4,3,1,2,2,3,4,1,1,5,1,1,4,2,5,5,5,1,1,4,5,4,1,1,4,2,1,4,1,2,2,5,1,1,5,1,1,3,4,4,1,2,3,1,5,5,4,1,4,1,2,1,5,1,1,1,3,4,1,1,5,1,5,1,1,5,1,1,4,3,2,4,1,4,1,5,3,3,1,5,1,3,1,1,4,1,4,5,2,3,1,1,1,1,3,1,2,1,5,1,1,5,1,1,1,1,4,1,4,3,1,5,1,1,5,4,4,2,1,4,5,1,1,3,3,1,1,4,2,5,5,2,4,1,4,5,4,5,3,1,4,1,5,2,4,5,3,1,3,2,4,5,4,4,1,5,1,5,1,2,2,1,4,1,1,4,2,2,2,4,1,1,5,3,1,1,5,4,4,1,5,1,3,1,3,2,2,1,1,4,1,4,1,2,2,1,1,3,5,1,2,1,3,1,4,5,1,3,4,1,1,1,1,4,3,3,4,5,1,1,1,1,1,2,4,5,3,4,2,1,1,1,3,3,1,4,1,1,4,2,1,5,1,1,2,3,4,2,5,1,1,1,5,1,1,4,1,2,4,1,1,2,4,3,4,2,3,1,1,2,1,5,4,2,3,5,1,2,3,1,2,2,1,4

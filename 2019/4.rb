# part 1
range = (382345..843167)

passwords = range.select do |number|
  incrementing = number.to_s.split('').each_cons(2).map { |pair| pair.join('<=') }.join('&&')

  eval(incrementing) && number.to_s.match?(/(\d)\1/)
end

puts "1: different passwords:"
puts passwords.uniq.size
# => 460

# part 2
puts "2: repeated criteria"
puts passwords.select { |p| p.to_s.split('').tally.any? { |_d, count| count == 2 } }.size
# => 290

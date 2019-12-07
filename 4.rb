# part 1
range = (382345..843167)

passwords = range.select do |number|
  incrementing = number.to_s.split('').each_cons(2).map { |pair| pair.join('<=') }.join('&&')

  eval(incrementing) && number.to_s.match?(/(\d)\1/)
end

"1: different passwords:"
puts passwords.uniq.size
# => 460

# part 2

# THERE I CHEATED!?
# => 290

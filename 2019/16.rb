
input = DATA.read.chomp.split('').map(&:to_i)

def fft(numbers, phases)
  return numbers if phases == 0
  print '.'
  result = 1.upto(numbers.size).map do |i|
    pattern = (([0]*i)+([1]*i)+([0]*i)+([-1]*i)).cycle

    numbers.each_with_index.map do |n, j|
      multiply = if j == 0
        pattern.next
        pattern.next
      else
        pattern.next
      end

      n * multiply
    end.reduce(:+)
  end.map { |r| r.abs % 10 }

  fft(result, phases - 1)
end

# part 1
result = fft(input, 100)[0..7].join
puts
puts result
# => "40921727"

# part 2
def faster_fft(numbers, phases)
  return numbers if phases.zero?
  print '.'

  n = numbers.reduce(:+)
  numbers = 0.upto(numbers.size - 1).each_with_object([]) do |i, memo|
    memo << n.abs % 10
    n -= numbers[i] # rocket science hack
  end

  faster_fft(numbers, phases - 1)
end

input = input * 10_000
input = input[input[0..6].join.to_i..-1]
result = faster_fft(input, 100)

puts
puts result[0..7].join
# => "89950138"

__END__
59708072843556858145230522180223745694544745622336045476506437914986923372260274801316091345126141549522285839402701823884690004497674132615520871839943084040979940198142892825326110513041581064388583488930891380942485307732666485384523705852790683809812073738758055115293090635233887206040961042759996972844810891420692117353333665907710709020698487019805669782598004799421226356372885464480818196786256472944761036204897548977647880837284232444863230958576095091824226426501119748518640709592225529707891969295441026284304137606735506294604060549102824977720776272463738349154440565501914642111802044575388635071779775767726626682303495430936326809

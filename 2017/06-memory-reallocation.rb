
def redistribute!(memory_banks, cycles = Hash.new(0), configurations = [])
  until cycles.any? { |_, count| count == 2 }
    cycles[memory_banks.dup] += 1
    configurations << memory_banks.dup

    redistribution = memory_banks.max
    index = memory_banks.index(redistribution)
    memory_banks[index] = 0

    1.upto(redistribution) do
      index += 1
      memory_banks[index % memory_banks.size] += 1
    end
  end

  yield cycles, configurations
end

memory_banks = DATA.read.chomp.scan(/\d+/).map(&:to_i)

redistribute!(memory_banks.dup) do |cycles, configurations|
  config, _ = cycles.find { |_, count| count == 2 }
  from, to  = configurations.each_with_index.select { |memory, index| memory == config }.map(&:last)

  puts 'How many redistribution cycles must be completed before a configuration is produced again?'
  puts cycles.keys.size
  # => 11137

  puts 'How many cycles are in the infinite loop that arises from the configuration?'
  puts (from...to).size
  # => 1037
end

__END__
14 0 15 12 11 11 3 5 1 6 8 4 9 1 8 4

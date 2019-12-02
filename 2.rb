p1 = [1,0,0,0,99].freeze
p2 = [2,3,0,3,99].freeze
p3 = [2,4,4,5,99,0].freeze
p4 = [1,1,1,4,99,5,6,0,99].freeze
p5 = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,19,5,23,1,23,5,27,2,27,10,31,1,31,9,35,1,35,5,39,1,6,39,43,2,9,43,47,1,5,47,51,2,6,51,55,1,5,55,59,2,10,59,63,1,63,6,67,2,67,6,71,2,10,71,75,1,6,75,79,2,79,9,83,1,83,5,87,1,87,9,91,1,91,9,95,1,10,95,99,1,99,13,103,2,6,103,107,1,107,5,111,1,6,111,115,1,9,115,119,1,119,9,123,2,123,10,127,1,6,127,131,2,131,13,135,1,13,135,139,1,9,139,143,1,9,143,147,1,147,13,151,1,151,9,155,1,155,13,159,1,6,159,163,1,13,163,167,1,2,167,171,1,171,13,0,99,2,0,14,0].freeze

def compute(program)
  operation = {
    1  => :+,
    2  => :*,
    99 => :halt
  }

  program.each_slice(4) do |slice|
    opcode, input_1, input_2, output = slice[0..3]

    if operation.fetch(opcode) == :halt
      break
    else
      program[output] = program[input_1].public_send(operation[opcode], program[input_2])
    end
  end

  program
end

puts compute(p1.dup).inspect # => [2, 0, 0, 0, 99]
puts compute(p2.dup).inspect # => [2, 3, 0, 6, 99]
puts compute(p3.dup).inspect # => [2, 4, 4, 5, 99, 9801]
puts compute(p4.dup).inspect # => [30, 1, 1, 4, 2, 5, 6, 0, 99]

# part 1
puts compute(p5.dup)[0] # => 3_654_868

# part 2
0.upto(99).each do |noun|
  0.upto(99).each do |verb|
    program = p5.dup
    program[1] = noun
    program[2] = verb

    if compute(program)[0] == 19_690_720
      puts "100 * #{noun} + #{verb}:"
      puts 100 * noun + verb
      break
    end
  end
end
# => 100 * 70 + 14:
# => 7014

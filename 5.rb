# part 1

# - Opcode 3 takes a single integer as input and saves it to the position given by its only parameter.
#   For example, the instruction 3,50 would take an input value and store it at address 50.
# - Opcode 4 outputs the value of its only parameter.
#   For example, the instruction 4,50 would output the value at address 50.

def compute(program, param = nil)
  counter = 0

  while counter >= 0
    # ABCDE
    #  1002
    # DE - two-digit opcode,      02 == opcode 2
    #  C - mode of 1st parameter,  0 == position mode
    #  B - mode of 2nd parameter,  1 == immediate mode
    #  A - mode of 3rd parameter,  0 == position mode,
    #                                   omitted due to being a leading zero
    e, d, c, b, a = program[counter].to_s.reverse.split('')
    # eval parameter modes
    pm = lambda do |i, value|
      { 1 => c.to_i, 2 => b.to_i, 3 => a.to_i }[i] == 0 ? program[value] : value
    end

    opcode = [d,e].join.to_i

    case opcode
    when 1 # +
      _opcode, input_1, input_2, output = program.slice(counter..(counter+3))
      program[output] = pm[1, input_1] + pm[2, input_2]
      counter += 4
    when 2 # *
      _opcode, input_1, input_2, output = program.slice(counter..(counter+3))
      program[output] = pm[1, input_1] * pm[2, input_2]
      counter += 4
    when 3 # save
      _opcode, store_at = program.slice(counter..(counter+1))
      program[store_at] = param # Parameters that an instruction writes to will never be in immediate mode.
      counter += 2
    when 4 # output
      _opcode, out_at = program.slice(counter..(counter+1))
      puts pm[1, out_at]
      counter += 2
    when 5 # jump true
      _opcode, input_1, input_2 = program.slice(counter..(counter+2))
      if pm[1, input_1] != 0
        counter = pm[2, input_2]
      else
        counter += 3
      end
    when 6 # jump false
      _opcode, input_1, input_2 = program.slice(counter..(counter+2))
      if pm[1, input_1] == 0
        counter = pm[2, input_2]
      else
        counter += 3
      end
    when 7 # <
       _opcode, input_1, input_2, input_3 = program.slice(counter..(counter+3))
       program[input_3] = pm[1, input_1] < pm[2, input_2] ? 1 : 0
       counter += 4
    when 8 # =
      _opcode, input_1, input_2, input_3 = program.slice(counter..(counter+3))
       program[input_3] = pm[1, input_1] == pm[2, input_2] ? 1 : 0
       counter += 4
    when 99
      counter = -1
    else
      raise ArgumentError, "counter #{counter}: #{program[counter]}"
    end
  end

  program
end

input = DATA.read.split(',').map(&:to_i)

# The program 3,0,4,0,99 outputs whatever it gets as input, then halts.
# tests
puts compute([3,0,4,0,99], 13) == [13, 0, 4, 0, 99]
puts compute([1,0,0,0,99]) == [2, 0, 0, 0, 99]
puts compute([2,3,0,3,99]) == [2, 3, 0, 6, 99]
puts compute([2,4,4,5,99,0]) == [2, 4, 4, 5, 99, 9801]
puts compute([1101,100,-1,4,0]) == [1101, 100, -1, 4, 99]
puts compute([1002,4,3,4,33]) == [1002,4,3,4,99]

# test input 1
puts 'diagnostic code for system ID 1:'
compute(input.dup, 1)
# 0
# 0
# 0
# 0
# 0
# 0
# 0
# 0
# 0
# 4511442

# part 2
puts 'test ='
compute([3,9,8,9,10,9,4,9,99,-1,8], 8) # equal to 8
compute([3,3,1108,-1,8,3,4,3,99], 8) # equal to 8

puts 'test <'
compute([3,9,7,9,10,9,4,9,99,-1,8], 7) # less than 8
compute([3,3,1107,-1,8,3,4,3,99], 7) # less than 8

puts 'test jump'
compute([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0) # 0
compute([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 13) # 1
compute([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0) # 0
compute([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 7) # 1

puts 'larger test:'
[7,8,9].each do |value|
  compute([3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], value)
end
# 999
# 1000
# 1001

puts 'diagnostic code for system ID 5:'
compute(input.dup, 5)
# 12648139

__END__
3,225,1,225,6,6,1100,1,238,225,104,0,101,71,150,224,101,-123,224,224,4,224,102,8,223,223,101,2,224,224,1,224,223,223,2,205,209,224,1001,224,-3403,224,4,224,1002,223,8,223,101,1,224,224,1,223,224,223,1101,55,24,224,1001,224,-79,224,4,224,1002,223,8,223,101,1,224,224,1,223,224,223,1,153,218,224,1001,224,-109,224,4,224,1002,223,8,223,101,5,224,224,1,224,223,223,1002,201,72,224,1001,224,-2088,224,4,224,102,8,223,223,101,3,224,224,1,223,224,223,1102,70,29,225,102,5,214,224,101,-250,224,224,4,224,1002,223,8,223,1001,224,3,224,1,223,224,223,1101,12,52,225,1101,60,71,225,1001,123,41,224,1001,224,-111,224,4,224,102,8,223,223,1001,224,2,224,1,223,224,223,1102,78,66,224,1001,224,-5148,224,4,224,1002,223,8,223,1001,224,2,224,1,223,224,223,1101,29,77,225,1102,41,67,225,1102,83,32,225,1101,93,50,225,1102,53,49,225,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,1107,677,677,224,1002,223,2,223,1005,224,329,101,1,223,223,7,677,677,224,1002,223,2,223,1005,224,344,1001,223,1,223,7,226,677,224,102,2,223,223,1006,224,359,101,1,223,223,1108,226,226,224,1002,223,2,223,1005,224,374,1001,223,1,223,8,226,677,224,1002,223,2,223,1006,224,389,1001,223,1,223,1108,226,677,224,1002,223,2,223,1006,224,404,101,1,223,223,1107,677,226,224,102,2,223,223,1006,224,419,101,1,223,223,1007,677,677,224,1002,223,2,223,1005,224,434,101,1,223,223,7,677,226,224,102,2,223,223,1006,224,449,1001,223,1,223,1008,226,677,224,1002,223,2,223,1006,224,464,101,1,223,223,8,677,677,224,1002,223,2,223,1006,224,479,101,1,223,223,108,226,226,224,102,2,223,223,1005,224,494,101,1,223,223,1107,226,677,224,1002,223,2,223,1006,224,509,101,1,223,223,107,226,226,224,1002,223,2,223,1006,224,524,1001,223,1,223,107,677,677,224,1002,223,2,223,1005,224,539,101,1,223,223,1007,226,226,224,102,2,223,223,1006,224,554,101,1,223,223,108,677,677,224,102,2,223,223,1005,224,569,101,1,223,223,107,677,226,224,102,2,223,223,1005,224,584,101,1,223,223,1008,226,226,224,102,2,223,223,1006,224,599,101,1,223,223,1108,677,226,224,1002,223,2,223,1006,224,614,101,1,223,223,8,677,226,224,102,2,223,223,1005,224,629,1001,223,1,223,1008,677,677,224,102,2,223,223,1006,224,644,101,1,223,223,1007,226,677,224,102,2,223,223,1005,224,659,101,1,223,223,108,226,677,224,102,2,223,223,1006,224,674,101,1,223,223,4,223,99,226

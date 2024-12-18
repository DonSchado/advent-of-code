# 9 relative mode
# The important difference is that relative mode parameters don't count from address 0.
# Instead, they count from a value called the relative base. The relative base starts at 0

# For example, given a relative base of 50,
# a relative mode parameter of -7 refers to memory address 50 + -7 = 43.

# Opcode 9 adjusts the relative base by the value of its only parameter.
# The relative base increases (or decreases, if the value is negative) by the value of the parameter.

# For example, if the relative base is 2000,
# then after the instruction 109,19, the relative base would be 2019.
# If the next instruction were 204,-34, then the value at address 1985 would be output.

# Memory beyond the initial program starts with the value 0 and can be read or written like any other memory

# part 1
require 'pry'

class Intcode
  class InputError < StandardError; end

  class Memory
    attr_accessor :memory

    def initialize(program)
      @memory = program.each_with_index.to_a.map(&:reverse).to_h
      @memory.default = 0
    end

    def [](i)
      @memory[i]
    end

    def []=(i, v)
      @memory[i] = v
    end

    def slice(range)
      @memory.values_at(*range)
    end
  end

  def compute(program, inputs = [])
    program = Memory.new(program)
    @output = []
    counter = 0
    rel_base = 0

    while counter >= 0
      e, d, c, b, a = program[counter].to_s.reverse.split('')
      r = ->(v, i=1) {
        mode = { 1 => c.to_i, 2 => b.to_i, 3 => a.to_i }[i.to_i]
        mode == 2 ? (rel_base + v) : v
      }
      pm = ->(i, value) {
        mode = { 1 => c.to_i, 2 => b.to_i, 3 => a.to_i }[i.to_i]
        if mode == 0
          program[value]
        elsif mode == 2
          program[rel_base + value]
        else
          value
        end
      }
      opcode = [d,e].join.to_i

      case opcode
      when 1 # +
        _opcode, input_1, input_2, output = program.slice(counter..(counter+3))
        program[r[output, 3]] = pm[1, input_1] + pm[2, input_2]
        counter += 4
      when 2 # *
        _opcode, input_1, input_2, output = program.slice(counter..(counter+3))
        program[r[output, 3]] = pm[1, input_1] * pm[2, input_2]
        counter += 4
      when 3 # save
        _opcode, store_at = program.slice(counter..(counter+1))
        program[r[store_at]] = (inputs.size == 1 ? inputs.first : inputs.shift)
        counter += 2
      when 4 # output
        _opcode, out_at = program.slice(counter..(counter+1))

        @output << pm[1, out_at]
        # puts @output
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
        program[r[input_3, 3]] = pm[1, input_1] < pm[2, input_2] ? 1 : 0
        counter += 4
      when 8 # =
        _opcode, input_1, input_2, input_3 = program.slice(counter..(counter+3))
        program[r[input_3, 3]] = pm[1, input_1] == pm[2, input_2] ? 1 : 0
        counter += 4
      when 9 # relative mod
        _opcode, input_1 = program.slice(counter..(counter+1))
        rel_base += pm[1, input_1]
        counter += 2
      when 99
        counter = -1
      else
        require 'pry'; binding.pry
        raise ArgumentError, "counter #{counter}: #{program[counter]}"
      end
    end

    @output
  end
end

cpu = Intcode.new

# copy of itself
boost_programm = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
puts cpu.compute(boost_programm) == [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]

# # # should output a 16-digit number
boost_programm = [1102,34915192,34915192,7,4,7,99,0]
puts cpu.compute(boost_programm) == [1219070632396864]

# # # output the large number in the middle
boost_programm = [104,1125899906842624,99]
puts cpu.compute(boost_programm) == [1125899906842624]

boost_programm = [1102,34463338,34463338,63,1007,63,34463338,63,1005,63,53,1101,0,3,1000,109,988,209,12,9,1000,209,6,209,3,203,0,1008,1000,1,63,1005,63,65,1008,1000,2,63,1005,63,904,1008,1000,0,63,1005,63,58,4,25,104,0,99,4,0,104,0,99,4,17,104,0,99,0,0,1101,29,0,1010,1102,1,1,1021,1101,0,36,1002,1101,573,0,1026,1101,0,33,1012,1102,1,25,1004,1102,1,38,1000,1102,31,1,1003,1102,23,1,1006,1102,777,1,1028,1102,20,1,1011,1101,0,566,1027,1101,0,27,1009,1101,26,0,1005,1101,0,0,1020,1102,1,37,1014,1101,32,0,1001,1101,0,24,1007,1101,0,35,1018,1101,30,0,1017,1101,0,22,1008,1102,460,1,1023,1101,0,768,1029,1102,1,487,1024,1102,1,34,1013,1102,1,28,1015,1101,0,39,1019,1101,478,0,1025,1101,0,463,1022,1101,21,0,1016,109,9,1208,0,30,63,1005,63,201,1001,64,1,64,1105,1,203,4,187,1002,64,2,64,109,3,1201,-8,0,63,1008,63,24,63,1005,63,227,1001,64,1,64,1106,0,229,4,209,1002,64,2,64,109,-1,2108,32,-8,63,1005,63,245,1106,0,251,4,235,1001,64,1,64,1002,64,2,64,109,-11,2101,0,2,63,1008,63,35,63,1005,63,275,1001,64,1,64,1105,1,277,4,257,1002,64,2,64,109,3,2101,0,-1,63,1008,63,36,63,1005,63,303,4,283,1001,64,1,64,1106,0,303,1002,64,2,64,109,16,21108,40,40,-6,1005,1013,325,4,309,1001,64,1,64,1106,0,325,1002,64,2,64,109,-4,21102,41,1,-4,1008,1011,41,63,1005,63,351,4,331,1001,64,1,64,1105,1,351,1002,64,2,64,109,-15,2102,1,4,63,1008,63,24,63,1005,63,375,1001,64,1,64,1106,0,377,4,357,1002,64,2,64,109,6,1201,-2,0,63,1008,63,25,63,1005,63,403,4,383,1001,64,1,64,1106,0,403,1002,64,2,64,109,8,2102,1,-6,63,1008,63,22,63,1005,63,425,4,409,1106,0,429,1001,64,1,64,1002,64,2,64,109,-1,2108,27,-4,63,1005,63,447,4,435,1106,0,451,1001,64,1,64,1002,64,2,64,109,8,2105,1,2,1105,1,469,4,457,1001,64,1,64,1002,64,2,64,109,5,2105,1,-2,4,475,1001,64,1,64,1106,0,487,1002,64,2,64,109,-33,1202,7,1,63,1008,63,37,63,1005,63,507,1105,1,513,4,493,1001,64,1,64,1002,64,2,64,109,2,2107,25,10,63,1005,63,535,4,519,1001,64,1,64,1106,0,535,1002,64,2,64,109,30,21107,42,41,-9,1005,1016,551,1106,0,557,4,541,1001,64,1,64,1002,64,2,64,109,2,2106,0,0,1001,64,1,64,1105,1,575,4,563,1002,64,2,64,109,-19,1202,-7,1,63,1008,63,32,63,1005,63,601,4,581,1001,64,1,64,1105,1,601,1002,64,2,64,109,-2,1207,-1,27,63,1005,63,619,4,607,1106,0,623,1001,64,1,64,1002,64,2,64,109,2,21101,43,0,6,1008,1014,45,63,1005,63,647,1001,64,1,64,1106,0,649,4,629,1002,64,2,64,109,17,1205,-4,663,4,655,1106,0,667,1001,64,1,64,1002,64,2,64,109,4,1205,-9,683,1001,64,1,64,1106,0,685,4,673,1002,64,2,64,109,-17,21101,44,0,-2,1008,1010,44,63,1005,63,711,4,691,1001,64,1,64,1105,1,711,1002,64,2,64,109,1,21102,45,1,3,1008,1016,42,63,1005,63,735,1001,64,1,64,1105,1,737,4,717,1002,64,2,64,109,-9,1207,1,25,63,1005,63,753,1105,1,759,4,743,1001,64,1,64,1002,64,2,64,109,23,2106,0,1,4,765,1001,64,1,64,1106,0,777,1002,64,2,64,109,-3,1206,-3,789,1105,1,795,4,783,1001,64,1,64,1002,64,2,64,109,-13,2107,25,-4,63,1005,63,815,1001,64,1,64,1105,1,817,4,801,1002,64,2,64,109,-9,21108,46,44,10,1005,1012,833,1105,1,839,4,823,1001,64,1,64,1002,64,2,64,109,-4,1208,10,22,63,1005,63,857,4,845,1105,1,861,1001,64,1,64,1002,64,2,64,109,28,1206,-6,879,4,867,1001,64,1,64,1105,1,879,1002,64,2,64,109,-4,21107,47,48,-3,1005,1019,897,4,885,1105,1,901,1001,64,1,64,4,64,99,21102,27,1,1,21101,915,0,0,1106,0,922,21201,1,14615,1,204,1,99,109,3,1207,-2,3,63,1005,63,964,21201,-2,-1,1,21102,1,942,0,1106,0,922,22101,0,1,-1,21201,-2,-3,1,21101,957,0,0,1105,1,922,22201,1,-1,-2,1106,0,968,22101,0,-2,-2,109,-3,2105,1,0]
puts cpu.compute(boost_programm, [1]).inspect # => 3512778005
puts cpu.compute(boost_programm, [2]).inspect # => 35920


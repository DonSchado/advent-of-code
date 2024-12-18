require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rspec'
  gem 'pry'
end

class Intcode
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
      raise ArgumentError.new(i) if i.negative?
      @memory[i] = v
    end

    def slice(range)
      @memory.values_at(*range)
    end

    def dump
      @memory.values
    end
  end

  attr_accessor :program, :counter, :rel_base, :input_queue, :output

  def initialize(program)
    @program  = Memory.new(program)
    @output   = []
    @counter  = 0
    @rel_base = 0
    @input_queue = []
  end

  def <<(input)
    @input_queue << input
  end

  def compute(inputs = [])
    while @counter >= 0
      e, d, c, b, a = program[@counter].to_s.reverse.split('')
      r = ->(v, i=1) {
        mode = { 1 => c.to_i, 2 => b.to_i, 3 => a.to_i }[i.to_i]
        mode == 2 ? (@rel_base + v) : v
      }
      pm = ->(i, value) {
        mode = { 1 => c.to_i, 2 => b.to_i, 3 => a.to_i }[i.to_i]
        if mode == 0
          program[value]
        elsif mode == 2
          program[@rel_base + value]
        else
          value
        end
      }
      opcode = [d,e].join.to_i

      case opcode
      when 1 # +
        _opcode, input_1, input_2, output = program.slice(@counter..(@counter+3))
        program[r[output, 3]] = pm[1, input_1] + pm[2, input_2]
        @counter += 4
      when 2 # *
        _opcode, input_1, input_2, output = program.slice(@counter..(@counter+3))
        program[r[output, 3]] = pm[1, input_1] * pm[2, input_2]
        @counter += 4
      when 3 # save
        _opcode, store_at = program.slice(@counter..(@counter+1))
        # inputs.shift or
        input = input_queue.shift or raise ArgumentError, 'expected input'
        program[r[store_at]] = input
        @counter += 2
      when 4 # output
        _opcode, out_at = program.slice(@counter..(@counter+1))
        if block_given?
          yield pm[1, out_at], self
        end

        @output << pm[1, out_at]
        @counter += 2
      when 5 # jump true
        _opcode, input_1, input_2 = program.slice(@counter..(@counter+2))
        if pm[1, input_1] != 0 # maybe `== 1` ?
          @counter = pm[2, input_2]
        else
          @counter += 3
        end
      when 6 # jump false
        _opcode, input_1, input_2 = program.slice(@counter..(@counter+2))
        if pm[1, input_1] == 0
          @counter = pm[2, input_2]
        else
          @counter += 3
        end
      when 7 # <
        _opcode, input_1, input_2, input_3 = program.slice(@counter..(@counter+3))
        program[r[input_3, 3]] = pm[1, input_1] < pm[2, input_2] ? 1 : 0
        @counter += 4
      when 8 # =
        _opcode, input_1, input_2, input_3 = program.slice(@counter..(@counter+3))
        program[r[input_3, 3]] = pm[1, input_1] == pm[2, input_2] ? 1 : 0
        @counter += 4
      when 9 # relative mod
        _opcode, input_1 = program.slice(@counter..(@counter+1))
        @rel_base += pm[1, input_1]
        @counter += 2
      when 99
        @counter = -1
      else
        # require 'pry'; binding.pry
        raise ArgumentError, "counter #{counter}: #{program[@counter]}"
      end
    end

    @output.any? ? @output : program.dump
  end
end

RSpec.configure do |c|
  c.color = true
  c.formatter = :documentation
  c.order = :random
end


RSpec.describe Intcode do
  subject { described_class }

  context 'day 2' do
    describe 'examples' do
      it { expect(subject.new([1,9,10,3,2,3,11,0,99,30,40,50]).compute).to eq([3500,9,10,70,2,3,11,0,99,30,40,50]) }
      xit { expect(subject.new.compute([1,0,0,0,99])).to eq([2,0,0,0,99]) }
      xit { expect(subject.new.compute([2,3,0,3,99])).to eq([2,3,0,6,99]) }
      xit { expect(subject.new.compute([2,4,4,5,99,0])).to eq([2,4,4,5,99,9801]) }
      xit { expect(subject.new.compute([1,1,1,4,99,5,6,0,99])).to eq([30,1,1,4,2,5,6,0,99]) }
    end

    let(:program) { [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,19,5,23,1,23,5,27,2,27,10,31,1,31,9,35,1,35,5,39,1,6,39,43,2,9,43,47,1,5,47,51,2,6,51,55,1,5,55,59,2,10,59,63,1,63,6,67,2,67,6,71,2,10,71,75,1,6,75,79,2,79,9,83,1,83,5,87,1,87,9,91,1,91,9,95,1,10,95,99,1,99,13,103,2,6,103,107,1,107,5,111,1,6,111,115,1,9,115,119,1,119,9,123,2,123,10,127,1,6,127,131,2,131,13,135,1,13,135,139,1,9,139,143,1,9,143,147,1,147,13,151,1,151,9,155,1,155,13,159,1,6,159,163,1,13,163,167,1,2,167,171,1,171,13,0,99,2,0,14,0] }

    describe 'part 1' do
      it 'value at position 0' do
        expect(subject.new(program).compute[0]).to eq(3_654_868)
      end
    end

    describe 'part 2' do
      it 'pair of inputs that produce the output 19690720' do
        program[1] = 70
        program[2] = 14
        expect(subject.new(program).compute[0]).to eq(19_690_720)
      end
    end
  end

  context 'day 5' do
    describe 'examples' do
      it 'outputs whatever it gets as input' do
        expect(subject.compute([3,0,4,0,99], [13])).to eq([13])
      end

      it 'negative is a valid program' do
        expect(subject.compute([1101,100,-1,4,0])).to eq([1101,100,-1,4,99])
      end

      describe 'parameter modes' do
        context 'position mode' do
          it 'supports = 8' do
            expect(subject.compute([3,9,8,9,10,9,4,9,99,-1,8], [7])).to eq([0])
            expect(subject.compute([3,9,8,9,10,9,4,9,99,-1,8], [8])).to eq([1])
            expect(subject.compute([3,9,8,9,10,9,4,9,99,-1,8], [9])).to eq([0])
          end

          it 'supports < 8' do
            expect(subject.compute([3,9,7,9,10,9,4,9,99,-1,8], [7])).to eq([1])
            expect(subject.compute([3,9,7,9,10,9,4,9,99,-1,8], [8])).to eq([0])
          end

          it 'supports jump' do
            expect(subject.compute([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], [0])).to eq([0])
            expect(subject.compute([3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], [13])).to eq([1])
          end
        end

        context 'immediate mode' do
          it 'multiplies and halts' do
            expect(subject.compute([1002,4,3,4,33])).to eq([1002,4,3,4,99])
          end

          it 'supports = 8' do
            expect(subject.compute([3,3,1108,-1,8,3,4,3,99], [7])).to eq([0])
            expect(subject.compute([3,3,1108,-1,8,3,4,3,99], [8])).to eq([1])
            expect(subject.compute([3,3,1108,-1,8,3,4,3,99], [9])).to eq([0])
          end

          it 'supports < 8' do
            expect(subject.compute([3,3,1107,-1,8,3,4,3,99], [7])).to eq([1])
            expect(subject.compute([3,3,1107,-1,8,3,4,3,99], [8])).to eq([0])
          end

          it 'supports jump' do
            expect(subject.compute([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], [0])).to eq([0])
            expect(subject.compute([3,3,1105,-1,9,1101,0,0,12,4,12,99,1], [7])).to eq([1])
          end
        end
      end

      it 'big jump test' do
        program = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]
        expect(subject.compute(program, [7])).to eq([999])
        expect(subject.compute(program, [8])).to eq([1000])
        expect(subject.compute(program, [9])).to eq([1001])
      end
    end

    describe 'part 1' do
      let(:program) { [3,225,1,225,6,6,1100,1,238,225,104,0,101,71,150,224,101,-123,224,224,4,224,102,8,223,223,101,2,224,224,1,224,223,223,2,205,209,224,1001,224,-3403,224,4,224,1002,223,8,223,101,1,224,224,1,223,224,223,1101,55,24,224,1001,224,-79,224,4,224,1002,223,8,223,101,1,224,224,1,223,224,223,1,153,218,224,1001,224,-109,224,4,224,1002,223,8,223,101,5,224,224,1,224,223,223,1002,201,72,224,1001,224,-2088,224,4,224,102,8,223,223,101,3,224,224,1,223,224,223,1102,70,29,225,102,5,214,224,101,-250,224,224,4,224,1002,223,8,223,1001,224,3,224,1,223,224,223,1101,12,52,225,1101,60,71,225,1001,123,41,224,1001,224,-111,224,4,224,102,8,223,223,1001,224,2,224,1,223,224,223,1102,78,66,224,1001,224,-5148,224,4,224,1002,223,8,223,1001,224,2,224,1,223,224,223,1101,29,77,225,1102,41,67,225,1102,83,32,225,1101,93,50,225,1102,53,49,225,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,1107,677,677,224,1002,223,2,223,1005,224,329,101,1,223,223,7,677,677,224,1002,223,2,223,1005,224,344,1001,223,1,223,7,226,677,224,102,2,223,223,1006,224,359,101,1,223,223,1108,226,226,224,1002,223,2,223,1005,224,374,1001,223,1,223,8,226,677,224,1002,223,2,223,1006,224,389,1001,223,1,223,1108,226,677,224,1002,223,2,223,1006,224,404,101,1,223,223,1107,677,226,224,102,2,223,223,1006,224,419,101,1,223,223,1007,677,677,224,1002,223,2,223,1005,224,434,101,1,223,223,7,677,226,224,102,2,223,223,1006,224,449,1001,223,1,223,1008,226,677,224,1002,223,2,223,1006,224,464,101,1,223,223,8,677,677,224,1002,223,2,223,1006,224,479,101,1,223,223,108,226,226,224,102,2,223,223,1005,224,494,101,1,223,223,1107,226,677,224,1002,223,2,223,1006,224,509,101,1,223,223,107,226,226,224,1002,223,2,223,1006,224,524,1001,223,1,223,107,677,677,224,1002,223,2,223,1005,224,539,101,1,223,223,1007,226,226,224,102,2,223,223,1006,224,554,101,1,223,223,108,677,677,224,102,2,223,223,1005,224,569,101,1,223,223,107,677,226,224,102,2,223,223,1005,224,584,101,1,223,223,1008,226,226,224,102,2,223,223,1006,224,599,101,1,223,223,1108,677,226,224,1002,223,2,223,1006,224,614,101,1,223,223,8,677,226,224,102,2,223,223,1005,224,629,1001,223,1,223,1008,677,677,224,102,2,223,223,1006,224,644,101,1,223,223,1007,226,677,224,102,2,223,223,1005,224,659,101,1,223,223,108,226,677,224,102,2,223,223,1006,224,674,101,1,223,223,4,223,99,226] }

      it 'diagnostic code for system ID 1' do
        expect(subject.compute(program.dup, [1])).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0, 4511442])
      end

      it 'diagnostic code for system ID 5' do
        expect(subject.compute(program.dup, [5])).to eq([12648139])
      end
    end
  end

  context 'day 7' do
    describe 'examples' do
      it '[4,3,2,1,0] -> 43210' do
        program = [3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0]
        phase_setting = [4,3,2,1,0]

        expect(cpu.compute(program.dup, [4, 0])).to eq([4])

        highest_signal = phase_setting.reduce(0) do |signal, phase|
          cpu.compute(program.dup, [phase, Array(signal).first])
        end

        expect(highest_signal).to eq([43210])
      end

      it '[0,1,2,3,4] -> 54321' do
        program = [3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0]
        phase_setting = [0,1,2,3,4]

        highest_signal = phase_setting.reduce(0) do |signal, phase|
          cpu.compute(program.dup, [phase, Array(signal).first])
        end

        expect(highest_signal).to eq([54321])
      end

      it '[1,0,4,3,2] -> 65210' do
        program = [3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0]
        phase_setting = [1,0,4,3,2]

        highest_signal = phase_setting.reduce(0) do |signal, phase|
          cpu.compute(program.dup, [phase, Array(signal).first])
        end

        expect(highest_signal).to eq([65210])
      end
    end

    describe 'part 1' do
      let(:program) { [3,8,1001,8,10,8,105,1,0,0,21,38,55,72,93,118,199,280,361,442,99999,3,9,1001,9,2,9,1002,9,5,9,101,4,9,9,4,9,99,3,9,1002,9,3,9,1001,9,5,9,1002,9,4,9,4,9,99,3,9,101,4,9,9,1002,9,3,9,1001,9,4,9,4,9,99,3,9,1002,9,4,9,1001,9,4,9,102,5,9,9,1001,9,4,9,4,9,99,3,9,101,3,9,9,1002,9,3,9,1001,9,3,9,102,5,9,9,101,4,9,9,4,9,99,3,9,101,1,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,1,9,9,4,9,99,3,9,101,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,1,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,99,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,99] }

      it 'returns best phase_setting 24013' do
        best_phase_setting = [0,1,2,3,4].permutation.max_by do |permutation|
          permutation.reduce(0) do |signal, phase|
            cpu.compute(program.dup, [phase, Array(signal).first])
          end
        end

        expect(best_phase_setting).to eq([2, 4, 0, 1, 3])
      end

      it 'returns highest signal 368584' do
        highest_signal = [2,4,0,1,3].reduce(0) do |signal, phase|
          cpu.compute(program.dup, [phase, Array(signal).first])
        end

        expect(highest_signal).to eq([368584])
      end
    end

    describe 'part 2' do
      pending # 35993240
    end
  end

  context 'day 9' do
    describe 'examples' do
      it 'copies itself' do
        program = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
        expect(subject.compute(program)).to eq([109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99])
      end

      it 'should output a 16-digit number' do
        program = [1102,34915192,34915192,7,4,7,99,0]
        expect(subject.compute(program)).to eq([1219070632396864])
      end

      it 'outputs the large number in the middle' do
        program = [104,1125899906842624,99]
        expect(subject.compute(program)).to eq([1125899906842624])
      end
    end

    describe 'part 1' do
      it 'returns 3512778005' do
        program = [1102,34463338,34463338,63,1007,63,34463338,63,1005,63,53,1101,0,3,1000,109,988,209,12,9,1000,209,6,209,3,203,0,1008,1000,1,63,1005,63,65,1008,1000,2,63,1005,63,904,1008,1000,0,63,1005,63,58,4,25,104,0,99,4,0,104,0,99,4,17,104,0,99,0,0,1101,29,0,1010,1102,1,1,1021,1101,0,36,1002,1101,573,0,1026,1101,0,33,1012,1102,1,25,1004,1102,1,38,1000,1102,31,1,1003,1102,23,1,1006,1102,777,1,1028,1102,20,1,1011,1101,0,566,1027,1101,0,27,1009,1101,26,0,1005,1101,0,0,1020,1102,1,37,1014,1101,32,0,1001,1101,0,24,1007,1101,0,35,1018,1101,30,0,1017,1101,0,22,1008,1102,460,1,1023,1101,0,768,1029,1102,1,487,1024,1102,1,34,1013,1102,1,28,1015,1101,0,39,1019,1101,478,0,1025,1101,0,463,1022,1101,21,0,1016,109,9,1208,0,30,63,1005,63,201,1001,64,1,64,1105,1,203,4,187,1002,64,2,64,109,3,1201,-8,0,63,1008,63,24,63,1005,63,227,1001,64,1,64,1106,0,229,4,209,1002,64,2,64,109,-1,2108,32,-8,63,1005,63,245,1106,0,251,4,235,1001,64,1,64,1002,64,2,64,109,-11,2101,0,2,63,1008,63,35,63,1005,63,275,1001,64,1,64,1105,1,277,4,257,1002,64,2,64,109,3,2101,0,-1,63,1008,63,36,63,1005,63,303,4,283,1001,64,1,64,1106,0,303,1002,64,2,64,109,16,21108,40,40,-6,1005,1013,325,4,309,1001,64,1,64,1106,0,325,1002,64,2,64,109,-4,21102,41,1,-4,1008,1011,41,63,1005,63,351,4,331,1001,64,1,64,1105,1,351,1002,64,2,64,109,-15,2102,1,4,63,1008,63,24,63,1005,63,375,1001,64,1,64,1106,0,377,4,357,1002,64,2,64,109,6,1201,-2,0,63,1008,63,25,63,1005,63,403,4,383,1001,64,1,64,1106,0,403,1002,64,2,64,109,8,2102,1,-6,63,1008,63,22,63,1005,63,425,4,409,1106,0,429,1001,64,1,64,1002,64,2,64,109,-1,2108,27,-4,63,1005,63,447,4,435,1106,0,451,1001,64,1,64,1002,64,2,64,109,8,2105,1,2,1105,1,469,4,457,1001,64,1,64,1002,64,2,64,109,5,2105,1,-2,4,475,1001,64,1,64,1106,0,487,1002,64,2,64,109,-33,1202,7,1,63,1008,63,37,63,1005,63,507,1105,1,513,4,493,1001,64,1,64,1002,64,2,64,109,2,2107,25,10,63,1005,63,535,4,519,1001,64,1,64,1106,0,535,1002,64,2,64,109,30,21107,42,41,-9,1005,1016,551,1106,0,557,4,541,1001,64,1,64,1002,64,2,64,109,2,2106,0,0,1001,64,1,64,1105,1,575,4,563,1002,64,2,64,109,-19,1202,-7,1,63,1008,63,32,63,1005,63,601,4,581,1001,64,1,64,1105,1,601,1002,64,2,64,109,-2,1207,-1,27,63,1005,63,619,4,607,1106,0,623,1001,64,1,64,1002,64,2,64,109,2,21101,43,0,6,1008,1014,45,63,1005,63,647,1001,64,1,64,1106,0,649,4,629,1002,64,2,64,109,17,1205,-4,663,4,655,1106,0,667,1001,64,1,64,1002,64,2,64,109,4,1205,-9,683,1001,64,1,64,1106,0,685,4,673,1002,64,2,64,109,-17,21101,44,0,-2,1008,1010,44,63,1005,63,711,4,691,1001,64,1,64,1105,1,711,1002,64,2,64,109,1,21102,45,1,3,1008,1016,42,63,1005,63,735,1001,64,1,64,1105,1,737,4,717,1002,64,2,64,109,-9,1207,1,25,63,1005,63,753,1105,1,759,4,743,1001,64,1,64,1002,64,2,64,109,23,2106,0,1,4,765,1001,64,1,64,1106,0,777,1002,64,2,64,109,-3,1206,-3,789,1105,1,795,4,783,1001,64,1,64,1002,64,2,64,109,-13,2107,25,-4,63,1005,63,815,1001,64,1,64,1105,1,817,4,801,1002,64,2,64,109,-9,21108,46,44,10,1005,1012,833,1105,1,839,4,823,1001,64,1,64,1002,64,2,64,109,-4,1208,10,22,63,1005,63,857,4,845,1105,1,861,1001,64,1,64,1002,64,2,64,109,28,1206,-6,879,4,867,1001,64,1,64,1105,1,879,1002,64,2,64,109,-4,21107,47,48,-3,1005,1019,897,4,885,1105,1,901,1001,64,1,64,4,64,99,21102,27,1,1,21101,915,0,0,1106,0,922,21201,1,14615,1,204,1,99,109,3,1207,-2,3,63,1005,63,964,21201,-2,-1,1,21102,1,942,0,1106,0,922,22101,0,1,-1,21201,-2,-3,1,21101,957,0,0,1105,1,922,22201,1,-1,-2,1106,0,968,22101,0,-2,-2,109,-3,2105,1,0]
        expect(subject.compute(program, [1])).to eq([3512778005])
      end
    end

    describe 'part 2' do
      it 'returns 35920' do
        program = [1102,34463338,34463338,63,1007,63,34463338,63,1005,63,53,1101,0,3,1000,109,988,209,12,9,1000,209,6,209,3,203,0,1008,1000,1,63,1005,63,65,1008,1000,2,63,1005,63,904,1008,1000,0,63,1005,63,58,4,25,104,0,99,4,0,104,0,99,4,17,104,0,99,0,0,1101,29,0,1010,1102,1,1,1021,1101,0,36,1002,1101,573,0,1026,1101,0,33,1012,1102,1,25,1004,1102,1,38,1000,1102,31,1,1003,1102,23,1,1006,1102,777,1,1028,1102,20,1,1011,1101,0,566,1027,1101,0,27,1009,1101,26,0,1005,1101,0,0,1020,1102,1,37,1014,1101,32,0,1001,1101,0,24,1007,1101,0,35,1018,1101,30,0,1017,1101,0,22,1008,1102,460,1,1023,1101,0,768,1029,1102,1,487,1024,1102,1,34,1013,1102,1,28,1015,1101,0,39,1019,1101,478,0,1025,1101,0,463,1022,1101,21,0,1016,109,9,1208,0,30,63,1005,63,201,1001,64,1,64,1105,1,203,4,187,1002,64,2,64,109,3,1201,-8,0,63,1008,63,24,63,1005,63,227,1001,64,1,64,1106,0,229,4,209,1002,64,2,64,109,-1,2108,32,-8,63,1005,63,245,1106,0,251,4,235,1001,64,1,64,1002,64,2,64,109,-11,2101,0,2,63,1008,63,35,63,1005,63,275,1001,64,1,64,1105,1,277,4,257,1002,64,2,64,109,3,2101,0,-1,63,1008,63,36,63,1005,63,303,4,283,1001,64,1,64,1106,0,303,1002,64,2,64,109,16,21108,40,40,-6,1005,1013,325,4,309,1001,64,1,64,1106,0,325,1002,64,2,64,109,-4,21102,41,1,-4,1008,1011,41,63,1005,63,351,4,331,1001,64,1,64,1105,1,351,1002,64,2,64,109,-15,2102,1,4,63,1008,63,24,63,1005,63,375,1001,64,1,64,1106,0,377,4,357,1002,64,2,64,109,6,1201,-2,0,63,1008,63,25,63,1005,63,403,4,383,1001,64,1,64,1106,0,403,1002,64,2,64,109,8,2102,1,-6,63,1008,63,22,63,1005,63,425,4,409,1106,0,429,1001,64,1,64,1002,64,2,64,109,-1,2108,27,-4,63,1005,63,447,4,435,1106,0,451,1001,64,1,64,1002,64,2,64,109,8,2105,1,2,1105,1,469,4,457,1001,64,1,64,1002,64,2,64,109,5,2105,1,-2,4,475,1001,64,1,64,1106,0,487,1002,64,2,64,109,-33,1202,7,1,63,1008,63,37,63,1005,63,507,1105,1,513,4,493,1001,64,1,64,1002,64,2,64,109,2,2107,25,10,63,1005,63,535,4,519,1001,64,1,64,1106,0,535,1002,64,2,64,109,30,21107,42,41,-9,1005,1016,551,1106,0,557,4,541,1001,64,1,64,1002,64,2,64,109,2,2106,0,0,1001,64,1,64,1105,1,575,4,563,1002,64,2,64,109,-19,1202,-7,1,63,1008,63,32,63,1005,63,601,4,581,1001,64,1,64,1105,1,601,1002,64,2,64,109,-2,1207,-1,27,63,1005,63,619,4,607,1106,0,623,1001,64,1,64,1002,64,2,64,109,2,21101,43,0,6,1008,1014,45,63,1005,63,647,1001,64,1,64,1106,0,649,4,629,1002,64,2,64,109,17,1205,-4,663,4,655,1106,0,667,1001,64,1,64,1002,64,2,64,109,4,1205,-9,683,1001,64,1,64,1106,0,685,4,673,1002,64,2,64,109,-17,21101,44,0,-2,1008,1010,44,63,1005,63,711,4,691,1001,64,1,64,1105,1,711,1002,64,2,64,109,1,21102,45,1,3,1008,1016,42,63,1005,63,735,1001,64,1,64,1105,1,737,4,717,1002,64,2,64,109,-9,1207,1,25,63,1005,63,753,1105,1,759,4,743,1001,64,1,64,1002,64,2,64,109,23,2106,0,1,4,765,1001,64,1,64,1106,0,777,1002,64,2,64,109,-3,1206,-3,789,1105,1,795,4,783,1001,64,1,64,1002,64,2,64,109,-13,2107,25,-4,63,1005,63,815,1001,64,1,64,1105,1,817,4,801,1002,64,2,64,109,-9,21108,46,44,10,1005,1012,833,1105,1,839,4,823,1001,64,1,64,1002,64,2,64,109,-4,1208,10,22,63,1005,63,857,4,845,1105,1,861,1001,64,1,64,1002,64,2,64,109,28,1206,-6,879,4,867,1001,64,1,64,1105,1,879,1002,64,2,64,109,-4,21107,47,48,-3,1005,1019,897,4,885,1105,1,901,1001,64,1,64,4,64,99,21102,27,1,1,21101,915,0,0,1106,0,922,21201,1,14615,1,204,1,99,109,3,1207,-2,3,63,1005,63,964,21201,-2,-1,1,21102,1,942,0,1106,0,922,22101,0,1,-1,21201,-2,-3,1,21101,957,0,0,1105,1,922,22201,1,-1,-2,1106,0,968,22101,0,-2,-2,109,-3,2105,1,0]
        expect(subject.compute(program, [2])).to eq([35920])
      end
    end
  end
end

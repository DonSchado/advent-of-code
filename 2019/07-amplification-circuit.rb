# # part 1


class Amp
  attr_reader :codes, :phase, :i, :halted

  def initialize(codes, phase)
    @codes  = codes
    @phase  = phase
    @halted = false
    @i      = 0
  end

  def run(inp)
    out = nil

    loop do
      opcode = codes[i] % 100

      modes = (codes[i] / 100).digits
      3.times { modes << 0 }

      refs = modes.map.with_index do |m, idx|
        address = i + idx + 1

        if m == 1
          address
        else
          codes[address]
        end
      end

      case opcode
      when 1
        op = :+
      when 2
        op = :*
      when 3
        if phase
          codes[refs[0]] = phase
          @phase = nil
        elsif inp
          codes[refs[0]] = inp
          inp = nil
        else
          return out
        end
      when 4
        out = codes[refs[0]]
      when 5
        if codes[refs[0]] != 0
          @i = codes[refs[1]]
          next
        end
      when 6
        if codes[refs[0]] == 0
          @i = codes[refs[1]]
          next
        end
      when 7
        if codes[refs[0]] < codes[refs[1]]
          codes[refs[2]] = 1
        else
          codes[refs[2]] = 0
        end
      when 8
        if codes[refs[0]] == codes[refs[1]]
          codes[refs[2]] = 1
        else
          codes[refs[2]] = 0
        end
      when 99
        @halted = true
        return out
      end

      codes[refs[2]] = codes[refs[0]].send(op, codes[refs[1]]) if op

      if [1, 2, 7, 8].include?(opcode)
        @i += 4
      elsif [5, 6].include?(opcode)
        @i += 3
      else
        @i += 2
      end
    end
  end
end

codes = DATA.read.split(",").map(&:to_i)

best = 0

(5..9).to_a.permutation.each do |phases|
  amps = phases.map do |phase|
    Amp.new(codes.clone, phase)
  end

  inp = 0

  while amps.none?(&:halted)
    amps.each do |amp|
      inp = amp.run(inp)
    end
  end

  best = [inp, best].max
end

puts best

# 35993240

__END__
3,8,1001,8,10,8,105,1,0,0,21,38,55,72,93,118,199,280,361,442,99999,3,9,1001,9,2,9,1002,9,5,9,101,4,9,9,4,9,99,3,9,1002,9,3,9,1001,9,5,9,1002,9,4,9,4,9,99,3,9,101,4,9,9,1002,9,3,9,1001,9,4,9,4,9,99,3,9,1002,9,4,9,1001,9,4,9,102,5,9,9,1001,9,4,9,4,9,99,3,9,101,3,9,9,1002,9,3,9,1001,9,3,9,102,5,9,9,101,4,9,9,4,9,99,3,9,101,1,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,1,9,9,4,9,99,3,9,101,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,101,1,9,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,99,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,99,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,99

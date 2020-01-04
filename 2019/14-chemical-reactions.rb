class Oreo
  attr_accessor :requirements
  attr_reader :reactions

  ORE = Proc.new { |chemical| chemical == 'ORE' }

  def initialize(input, requirements)
    @requirements = Hash.new(0).update(requirements)
    @reactions = normalize(input)
  end

  def process
    until requirements.reject(&ORE).none? { |_, required_qty| required_qty > 0 }
      requirements.reject(&ORE).each do |chemical, required_qty|
        inputs, provided_qty = reactions[chemical]
        amount = (required_qty / provided_qty.to_f).ceil

        inputs.each { |chemical, required_qty| requirements[chemical] += required_qty * amount }

        requirements[chemical] -= provided_qty * amount
      end

      requirements.delete_if { |_, required_qty| required_qty.zero? }
    end
  end

  def ore
    requirements['ORE']
  end

  private

  # {
  #   "A"    => [{"ORE" => 9}, 2],
  #   "B"    => [{"ORE" => 8}, 3],
  #   "C"    => [{"ORE" => 7}, 5],
  #   "AB"   => [{"A" => 3, "B" => 4}, 1],
  #   "BC"   => [{"B" => 5, "C" => 7}, 1],
  #   "CA"   => [{"C" => 4, "A" => 1}, 1],
  #   "FUEL" => [{"AB" => 2, "BC" => 3, "CA" => 4}, 1]
  # }
  def normalize(input)
    input.each_line.each_with_object({}) do |reaction, memo|
      inputs, output = reaction.split(' => ')

      inputs = inputs.split(', ').each_with_object({}) do |input, memo|
        qty, key = input.split(' ')
        memo[key] = qty.to_i
      end

      qty, key  = output.split(' ')
      memo[key] = [inputs, qty.to_i]
    end
  end
end


EXAMPLE_1 = <<~EXAMPLE_1
  10 ORE => 10 A
  1 ORE => 1 B
  7 A, 1 B => 1 C
  7 A, 1 C => 1 D
  7 A, 1 D => 1 E
  7 A, 1 E => 1 FUEL
EXAMPLE_1
oreo = Oreo.new(EXAMPLE_1, 'FUEL' => 1)
oreo.process
puts "EXAMPLE_1, ORE used: #{oreo.ore} ? #{oreo.ore == 31}"


EXAMPLE_2 = <<~EXAMPLE_2
  9 ORE => 2 A
  8 ORE => 3 B
  7 ORE => 5 C
  3 A, 4 B => 1 AB
  5 B, 7 C => 1 BC
  4 C, 1 A => 1 CA
  2 AB, 3 BC, 4 CA => 1 FUEL
EXAMPLE_2
oreo = Oreo.new(EXAMPLE_2, 'FUEL' => 1)
oreo.process
puts "EXAMPLE_2, ORE used: #{oreo.ore} ? #{oreo.ore == 165}"


EXAMPLE_3 = <<~EXAMPLE_3
  157 ORE => 5 NZVS
  165 ORE => 6 DCFZ
  44 XJWVT, 5 KHKGT, 1 QDVJ, 29 NZVS, 9 GPVTF, 48 HKGWZ => 1 FUEL
  12 HKGWZ, 1 GPVTF, 8 PSHF => 9 QDVJ
  179 ORE => 7 PSHF
  177 ORE => 5 HKGWZ
  7 DCFZ, 7 PSHF => 2 XJWVT
  165 ORE => 2 GPVTF
  3 DCFZ, 7 NZVS, 5 HKGWZ, 10 PSHF => 8 KHKGT
EXAMPLE_3
oreo = Oreo.new(EXAMPLE_3, 'FUEL' => 1)
oreo.process
puts "EXAMPLE_2, ORE used: #{oreo.ore} ? #{oreo.ore == 13312}"


input = DATA.read

fuel = 1863700
ore = 0
until ore >= 1_000_000_000_000
  fuel += 1
  oreo = Oreo.new(input.dup, 'FUEL' => fuel)
  oreo.process
  puts "PART_1, ORE use: #{fuel} #{oreo.ore}" # ? #{oreo.ore == 870051}"
  ore = oreo.ore
end

# YAY: 1863741 fuel for 999999809355 ore

__END__
3 QVSV => 2 WXRQ
1 KXSC, 2 PSBCN, 11 DNCJV, 2 FTCT, 1 BGMC => 7 PTHL
1 PXFX => 1 LBZJ
2 WXRQ, 12 ZSCZD => 2 HLQM
1 HDTJ, 1 LBZJ, 1 SLPCX, 5 SMCGZ, 3 MFMX, 4 CHZT, 12 BKBCB => 1 HRNSK
10 WSNDR, 1 JCBJ, 3 LBZJ => 2 QBTSV
22 LHZDG, 5 WFXH => 4 XTQRH
1 HLQM => 3 WSNDR
4 NTJCX => 6 TVMCM
1 VDSW, 9 SLPCX => 1 QCMX
2 MFMX => 8 NTJCX
154 ORE => 4 BSTS
12 TKML => 7 FWTFH
14 VDSW, 7 FVGK, 2 JCBJ => 4 LVFB
15 PLGZ, 27 FTCT, 1 LVFB => 4 TNGFX
2 WHPJT, 20 FXPHZ => 7 PQKMJ
6 NJWBT, 8 KVTD, 1 LQFW => 4 ZCDCW
1 QVSV, 2 FXPHZ => 5 ZSCZD
16 LRNQK => 6 BKBCB
5 FXPHZ => 1 FVGK
2 PXFX => 5 CHZT
17 SMZS, 1 VDSW, 7 BSTS => 5 SLPCX
9 RXJQJ, 2 ZVTW, 1 JMDT => 8 BGMC
5 PXFX, 1 FVGK, 2 TGHSD => 2 LRNQK
13 JMDT, 1 BHRFW, 32 MCKPL => 5 KXSC
5 CBZMB => 8 BLTD
3 KVTD, 2 LQFW, 1 LBZJ => 5 NJWBT
1 MCKPL, 2 CHZT, 6 TKML => 6 JCBJ
1 JSBS => 9 TGHSD
6 RXJQJ, 20 LRNQK, 29 KVTD => 8 PLGZ
18 WHPJT => 3 SMCGZ
157 ORE => 8 PNFB
9 QBTSV, 1 LFRF, 2 TNGFX, 4 FTCT, 9 QCMX, 4 PSBCN, 14 ZCDCW, 1 TVMCM => 7 CKQG
8 WHPJT => 9 LFRF
5 VDSW, 24 FWTFH => 1 JMDT
2 WXRQ, 4 BLTD => 7 WHPJT
14 VDSW => 3 CBZMB
1 QCMX, 19 BHRFW, 2 NJWBT => 3 FTCT
3 XTQRH => 2 KVTD
5 QBTSV, 2 JMDT, 3 LVFB => 3 HDTJ
16 PQKMJ, 1 WSNDR => 5 DNCJV
1 CBZMB, 2 PTHL, 6 HRNSK, 80 WHPJT, 10 CKQG, 55 ZVTW => 1 FUEL
5 BKBCB, 3 WSNDR => 1 MCKPL
158 ORE => 3 LHZDG
1 HLQM, 1 ZSCZD => 2 VDSW
140 ORE => 6 QVSV
4 ZSCZD, 13 TGHSD => 1 TKML
1 SLPCX, 3 TKML => 2 HWDQZ
1 BSTS, 8 WXRQ => 5 LQFW
3 BGMC, 3 LRNQK, 3 QBTSV => 6 PSBCN
1 PNFB => 4 FXPHZ
8 WXRQ => 7 JSBS
1 WXRQ, 8 PNFB, 3 XTQRH => 9 PXFX
1 WSNDR, 13 JSBS, 1 VDSW => 8 SMZS
6 NJWBT => 4 BHRFW
1 PXFX, 11 JSBS => 5 RXJQJ
103 ORE => 2 WFXH
5 WHPJT, 6 LRNQK => 2 MFMX
32 HWDQZ, 1 JMDT => 5 ZVTW

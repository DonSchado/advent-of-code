pair_rules = DATA.read.split("\n").each_with_object({}) do |rule, h|
  h.merge!(Hash[*rule.split(' -> ')])
end

# p pair_rules

polymer_template = 'CKFFSCFSCBCKBPBCSPKP'

(1..10).each do |step|
  chain = []
  polymer_template = polymer_template.split('')

  polymer_template.each_with_index do |char, i|
    break if i == polymer_template.size-1

    key = char + polymer_template[i+1]
    # p key: key

    result = char + pair_rules[key] + polymer_template[i+1]
    # p result: result

    chain << result
  end
  polymer_template = chain.each_with_index.map {|e, i| i < chain.size-1 ? e[0..-2] : e}.join
  # p polymer_template
end

# step 4
# p polymer_template == 'NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB'

counts = polymer_template.split('').tally
p counts: counts

puts ' What do you get if you take the quantity of the most common element and subtract the quantity of the least common element?'
p counts.values.max - counts.values.min
# => 3247


__END__
NS -> P
KV -> B
FV -> S
BB -> V
CF -> O
CK -> N
BC -> B
PV -> N
KO -> C
CO -> O
HP -> P
HO -> P
OV -> O
VO -> C
SP -> P
BV -> H
CB -> F
SF -> H
ON -> O
KK -> V
HC -> N
FH -> P
OO -> P
VC -> F
VP -> N
FO -> F
CP -> C
SV -> S
PF -> O
OF -> H
BN -> V
SC -> V
SB -> O
NC -> P
CN -> K
BP -> O
PC -> H
PS -> C
NB -> K
VB -> P
HS -> V
BO -> K
NV -> B
PK -> K
SN -> H
OB -> C
BK -> S
KH -> P
BS -> S
HV -> O
FN -> F
FS -> N
FP -> F
PO -> B
NP -> O
FF -> H
PN -> K
HF -> H
VK -> K
NF -> K
PP -> H
PH -> B
SK -> P
HN -> B
VS -> V
VN -> N
KB -> O
KC -> O
KP -> C
OS -> O
SO -> O
VH -> C
OK -> B
HH -> B
OC -> P
CV -> N
SH -> O
HK -> N
NO -> F
VF -> S
NN -> O
FK -> V
HB -> O
SS -> O
FB -> B
KS -> O
CC -> S
KF -> V
VV -> S
OP -> H
KN -> F
CS -> H
CH -> P
BF -> F
NH -> O
NK -> C
OH -> C
BH -> O
FC -> V
PB -> B

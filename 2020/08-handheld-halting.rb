input = DATA.read.split("\n")

program = input.each_with_index.each_with_object({}) do |(line, i), memo|
  operation, value = line.split
  memo[i] = { id: i, operation: operation, value: value.to_i }
end

# line => count

DEBUG = false

def debug(&block)
  return unless DEBUG
  block.call
end

def run(current_program)
  history     = Hash.new(0)
  instruction = 0
  acc         = 0

  loop do
    line = current_program[instruction]

    break { state: 'error', acc: acc - 1, instruction: instruction, line: line } if history.any? { |_k, v| v >= 2 }
    break { state: 'terminate', acc: acc } if line.nil?

    debug do
      p line
      p state_from = { state: 'from', acc: acc, instruction: instruction, history: history }
      puts '=>'
    end

    history[line[:id]] += 1

    case line[:operation]
    when /nop/
      instruction += 1
    when /acc/
      acc += line[:value]
      instruction += 1
    when /jmp/
      instruction += line[:value]
    end

    debug do
      p state_to = { state: 'to', acc: acc, instruction: instruction, history: history }
      puts '---'
    end
  end
end

def mutator(program, id = 0)
  mutation = program.clone
  line     = mutation[id]

  case line[:operation]
  when /nop/
    mutation[id] = mutation[id].merge(operation: "jmp")
  when /jmp/
    mutation[id] = mutation[id].merge(operation: "nop")
  end

  mutation
end

# pp program
# {0=>{:id=>0, :operation=>"nop", :value=>0},
#  1=>{:id=>1, :operation=>"acc", :value=>1},
#  2=>{:id=>2, :operation=>"jmp", :value=>4},
#  3=>{:id=>3, :operation=>"acc", :value=>3},
#  4=>{:id=>4, :operation=>"jmp", :value=>-3},
#  5=>{:id=>5, :operation=>"acc", :value=>-99},
#  6=>{:id=>6, :operation=>"acc", :value=>1},
#  7=>{:id=>7, :operation=>"jmp", :value=>-4},
#  8=>{:id=>8, :operation=>"acc", :value=>6}}

output = run(program)


# part 1
puts 'Immediately before any instruction is executed a second time, what value is in the accumulator?'
puts output
puts # => 1217

# part 2
puts 'Fix the program so that it terminates normally by changing exactly one jmp/nop. What is the value of the accumulator after the program terminates?'

mutations = 0
while output[:state] == "error" && mutations < program.keys.size
  next_try  = mutator(program, mutations)
  output    = run(next_try)

  debug do
    p state = { mutations: mutations, output: output }
  end

  mutations += 1
end

puts output, "#{mutations} mutations"

# __END__
# nop +0
# acc +1
# jmp +4
# acc +3
# jmp -3
# acc -99
# acc +1
# jmp -4
# acc +6

__END__
acc +0
jmp +516
acc -16
nop +326
jmp +366
jmp +400
jmp +494
acc -5
jmp +475
acc +29
nop +24
jmp +186
jmp -5
acc +50
acc +49
acc +49
nop +507
jmp +236
acc -4
acc +50
acc +48
jmp +293
jmp +461
acc +48
acc +2
jmp +241
acc +38
jmp +544
jmp +1
jmp +382
acc -4
acc -10
acc +44
jmp +444
jmp +1
acc +20
acc -1
acc +25
jmp +332
acc +18
jmp +184
acc +1
acc +20
acc -7
acc -12
jmp +84
acc +30
jmp -19
nop +491
acc +37
acc +44
jmp +220
acc +3
acc +19
jmp +485
jmp +222
nop +264
acc +4
jmp +151
nop -36
acc +48
jmp +356
acc +28
acc +29
nop +397
jmp +168
nop +115
acc -13
acc -11
jmp +470
jmp +201
acc +48
acc -6
acc -18
acc -13
jmp +442
jmp +266
acc +10
acc +30
acc -7
acc -8
jmp +380
acc +1
nop +106
acc +9
acc -11
jmp -79
jmp +166
acc -9
jmp +300
acc +39
acc +1
acc +27
acc +26
jmp +367
jmp +291
acc +18
jmp +100
acc +25
acc +43
acc -8
acc -12
jmp +475
acc +15
jmp +492
acc -5
acc -12
acc +35
acc +25
jmp +360
nop +301
acc +32
acc -1
jmp +436
acc +21
jmp +109
acc +1
nop +230
jmp -113
acc +24
acc +12
acc +13
acc +27
jmp -52
jmp +476
acc +15
acc -18
acc -13
jmp +323
acc -10
acc +35
acc -6
nop +377
jmp +8
jmp +430
nop +50
acc +33
acc -1
jmp -72
acc -19
jmp -92
jmp +1
jmp -87
nop -120
nop -34
jmp +159
jmp +183
jmp +1
acc -4
acc +49
acc -4
jmp +73
acc -18
acc +34
acc -8
jmp +403
acc +32
acc +0
acc +0
jmp +390
acc +19
jmp +305
acc -15
jmp +176
acc +3
jmp +36
acc +29
acc +21
jmp +1
acc -17
jmp +144
acc +16
acc +4
acc +49
acc -7
jmp -65
acc +28
acc +2
acc +23
acc +46
jmp +278
jmp +424
acc +45
acc +7
jmp -49
jmp -50
acc -11
nop -121
jmp -140
jmp +1
acc -8
jmp +206
acc -7
jmp +1
acc +20
acc +30
jmp +375
nop +312
jmp +111
acc +23
jmp -15
acc +27
acc +46
acc +36
jmp +360
acc +1
acc +25
acc +29
jmp -137
jmp +177
acc +15
acc -13
acc +48
acc +29
jmp +76
nop -174
acc +27
jmp +214
acc +4
jmp +120
nop -165
acc -16
jmp +2
jmp +238
jmp +224
jmp -154
acc +12
jmp +162
acc +31
acc +26
acc -13
acc +18
jmp +173
acc +38
jmp +1
jmp +199
jmp -202
jmp +127
acc -12
jmp -42
acc -12
acc +36
acc -4
acc +24
jmp +343
acc -17
nop +277
acc +13
jmp +56
jmp +41
nop +92
acc +32
jmp +182
nop +111
acc +0
acc +29
jmp +219
nop -234
acc +0
acc +31
acc +49
jmp +216
jmp +247
acc +24
acc -10
jmp +218
acc +14
acc -19
acc +14
jmp +11
jmp +82
acc +5
acc +28
acc +35
jmp -93
acc +24
jmp -210
acc +39
jmp -107
jmp -150
acc -7
jmp -185
acc +25
acc -15
jmp +63
acc +14
acc +50
jmp -7
acc +13
jmp +298
nop +69
jmp -268
acc -5
jmp +66
jmp +48
nop -1
acc +38
acc +3
acc +46
jmp +259
nop +235
acc +4
jmp -186
jmp +94
acc -16
acc +6
jmp +287
acc -19
jmp -221
jmp -69
acc +8
nop -102
acc +31
jmp +204
jmp -81
acc +12
acc +21
acc -8
nop +151
jmp -155
acc +50
nop +145
acc -6
acc +0
jmp -296
acc +16
acc +30
acc +11
jmp +254
acc +0
acc -8
nop +162
acc -17
jmp -144
acc +6
acc +2
acc +32
acc -5
jmp +21
jmp -77
acc +38
jmp +117
acc +27
acc -11
nop -203
jmp +201
jmp -305
acc +40
nop -330
acc -7
jmp -279
jmp +60
nop -163
jmp -53
nop +115
acc +24
jmp +1
acc +45
jmp -92
acc +0
acc +13
jmp -302
acc +25
jmp +208
nop -293
jmp +5
jmp +1
acc -13
nop -272
jmp +62
acc -4
acc +32
acc +49
jmp -124
acc -19
nop -246
jmp -353
nop -349
acc +13
acc +21
jmp -165
acc +14
acc +37
nop +28
acc +7
jmp -308
acc +11
jmp +71
jmp -139
nop -19
acc -7
acc -3
jmp -302
acc -2
acc +1
nop -43
jmp -280
acc +10
acc +9
jmp -358
acc +39
acc +16
acc -11
jmp +1
jmp +142
acc -15
acc -17
acc +9
acc +11
jmp -172
jmp -90
nop +135
acc -1
jmp -379
acc +39
acc -13
jmp -57
acc -3
acc -7
jmp +1
jmp +80
acc +7
acc +11
acc +30
nop +69
jmp -140
acc +11
acc +7
acc +3
jmp -417
jmp -314
acc -6
jmp -6
jmp -224
acc +0
jmp -131
acc +7
acc +33
jmp +20
acc +32
acc -14
nop -375
jmp -394
acc +8
acc +47
acc +29
acc -6
jmp -381
acc -8
jmp -353
jmp -108
acc -16
acc +21
jmp -329
acc +13
acc +0
acc +0
jmp -402
acc -8
jmp -307
jmp -308
jmp -358
acc +38
acc -19
acc +33
jmp -276
jmp -114
acc -6
jmp +55
acc +16
jmp -244
nop +22
acc -7
acc +19
jmp -154
jmp +18
jmp -50
acc +31
acc +50
acc +2
jmp -260
acc -16
jmp -135
acc +50
acc -9
acc +50
acc +27
jmp -323
acc +26
nop -249
acc +46
acc +3
jmp -474
acc +50
acc -7
jmp -78
jmp +1
acc -6
acc +6
jmp +94
acc +47
acc -3
acc +13
jmp -485
nop -499
acc +35
acc +35
acc -1
jmp -259
nop -486
acc +48
acc -4
jmp +23
acc +33
acc +37
acc +10
jmp +61
acc -1
jmp +1
jmp +1
acc -8
jmp +61
jmp -237
jmp -164
acc +39
acc +38
nop -302
jmp -468
acc -15
jmp -6
acc -9
acc +1
acc +41
acc +48
jmp -285
acc +1
acc +24
jmp -111
jmp -90
acc +46
acc +21
acc +43
jmp -103
acc -9
nop -5
jmp -274
acc -13
jmp -262
jmp -39
acc +43
nop -463
acc +15
acc +23
jmp -176
nop -305
acc +2
acc +28
jmp -198
acc +15
acc -18
jmp -473
acc -13
acc +9
jmp -46
acc +1
acc +43
acc +6
jmp +10
acc +24
acc -3
jmp -424
acc -1
acc +47
jmp +1
acc +20
jmp -17
jmp -59
nop -19
acc +42
acc +47
jmp -9
jmp -576
nop -148
acc +0
jmp +12
acc -15
jmp -209
acc +13
jmp -442
nop -548
nop -62
acc +22
jmp -92
jmp -516
acc +8
jmp -301
acc +1
jmp -146
acc -15
jmp -366
jmp -440
acc +17
acc +25
acc +28
jmp -240
acc -2
acc +25
nop -68
acc +14
jmp +1

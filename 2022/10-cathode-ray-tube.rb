program = DATA.read.split("\n")

INSTRUCTIONS = {
  'noop' => 1,
  'addx' => 2,
}

cycle = 0
x_register = 1
cycles = {}

program.each do |instruction|
  command, argument = instruction.split(' ')

  INSTRUCTIONS[command].times do
    cycle += 1
    cycles[cycle] = x_register # value during execution
  end

  x_register += argument.to_i
end

signals  = [20, 60, 100, 140, 180, 220]
values   = cycles.values_at(*signals)
strength = signals.zip(values).sum { |a, b| a * b }

p strength # => 14820

WIDTH = 40

cycles.each do |cycle, pos|
  x = (cycle-1) % WIDTH
  puts if x.zero?
  print x.between?(pos-1, pos+1) ? '█' : ' '
end
puts
# ███  ████ ████ █  █ ████ ████ █  █  ██
# █  █    █ █    █ █  █    █    █  █ █  █
# █  █   █  ███  ██   ███  ███  ████ █  █
# ███   █   █    █ █  █    █    █  █ ████
# █ █  █    █    █ █  █    █    █  █ █  █
# █  █ ████ ████ █  █ ████ █    █  █ █  █

__END__
noop
noop
addx 5
noop
noop
addx 1
addx 3
addx 2
addx 4
addx 3
noop
addx 2
addx 1
noop
noop
addx 4
noop
addx 1
addx 2
addx 5
addx 3
noop
addx -1
addx -37
addx 37
addx -34
addx 7
noop
addx -2
addx 2
noop
noop
noop
addx 5
addx 2
noop
addx 3
addx 15
addx -8
addx -9
addx 21
addx -9
addx 5
addx 2
addx 3
addx -2
addx -38
noop
addx 3
addx 37
addx -33
addx 5
noop
noop
addx 5
noop
noop
addx 5
noop
addx -1
addx 1
addx 5
noop
noop
addx 5
noop
noop
noop
addx 1
addx 2
noop
addx 3
addx -36
noop
noop
noop
addx 6
addx 21
addx -17
addx 18
addx -8
addx -7
addx 2
addx 5
addx -8
addx 13
addx -2
addx 7
noop
addx -2
addx 5
addx 2
addx 1
noop
addx -38
addx 4
addx 3
noop
addx 34
addx -29
addx -2
addx 10
addx -3
addx 2
addx 3
noop
addx -22
addx 2
addx 23
addx 7
noop
noop
addx 3
noop
addx 2
addx -18
addx 19
addx -38
addx 5
addx 2
noop
addx 1
addx 4
addx 1
noop
noop
addx 2
addx 5
addx 2
noop
addx 1
noop
addx 2
addx 8
addx -1
addx -30
addx 31
addx 2
addx 5
addx -35
noop

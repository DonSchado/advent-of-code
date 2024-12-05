input = DATA.read.split("\n\n")

def parse_monkeys(input, part:)
  input.each_with_object({}) do |config, memo|
    id, items, op, test, if_true, if_false = config.split("\n").map(&:strip)

    memo[id.scan(/\d/).first.to_i] = Monkey.new(
      items.scan(/\d+/).map(&:to_i),
      op.gsub!("Operation: new = ", ''),
      test.scan(/\d+/).first.to_i,
      if_true.reverse.to_i,
      if_false.reverse.to_i,
      part
    )
  end
end

Monkey = Struct.new(:items, :op, :test, :if_true, :if_false, :part) do
  attr_accessor :counter

  def turn(&block)
    @counter ||= 0

    until items.empty?
      @counter += 1
      item = inspect_item(items.shift)
      throw_item(item, &block)
    end
  end

  def inspect_item(old)
    case part
    when 1
      eval(op) / 3 # magic relief
    when 2
      eval(op) % $least_common_multiple
    end
  end

  def throw_item(item)
    target = (item % test).zero? ? if_true : if_false
    yield [item, target]
  end
end

def monkey_business(monkeys)
  monkeys.values.map(&:counter).sort.last(2).reduce(:*)
end

monkeys = parse_monkeys(input, part: 1)

20.times do
  monkeys.each do |id, monkey|
    monkey.turn do |item, target|
      monkeys[target].items << item
    end
  end
end

monkeys.each do |id, monkey|
  puts "Monkey #{id} inspected items #{monkey.counter} times."
end

puts 'part 1:'
p monkey_business(monkeys)
# => 121450


monkeys = parse_monkeys(input, part: 2)

# https://en.wikipedia.org/wiki/Least_common_multiple
$least_common_multiple = monkeys.values.map(&:test).reduce(:*)

10_000.times do
  monkeys.each do |id, monkey|
    monkey.turn do |item, target|
      monkeys[target].items << item
    end
  end
end

puts 'part 2:'
p monkey_business(monkeys)
# => 28244037010


__END__
Monkey 0:
  Starting items: 57
  Operation: new = old * 13
  Test: divisible by 11
    If true: throw to monkey 3
    If false: throw to monkey 2

Monkey 1:
  Starting items: 58, 93, 88, 81, 72, 73, 65
  Operation: new = old + 2
  Test: divisible by 7
    If true: throw to monkey 6
    If false: throw to monkey 7

Monkey 2:
  Starting items: 65, 95
  Operation: new = old + 6
  Test: divisible by 13
    If true: throw to monkey 3
    If false: throw to monkey 5

Monkey 3:
  Starting items: 58, 80, 81, 83
  Operation: new = old * old
  Test: divisible by 5
    If true: throw to monkey 4
    If false: throw to monkey 5

Monkey 4:
  Starting items: 58, 89, 90, 96, 55
  Operation: new = old + 3
  Test: divisible by 3
    If true: throw to monkey 1
    If false: throw to monkey 7

Monkey 5:
  Starting items: 66, 73, 87, 58, 62, 67
  Operation: new = old * 7
  Test: divisible by 17
    If true: throw to monkey 4
    If false: throw to monkey 1

Monkey 6:
  Starting items: 85, 55, 89
  Operation: new = old + 4
  Test: divisible by 2
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 7:
  Starting items: 73, 80, 54, 94, 90, 52, 69, 58
  Operation: new = old + 7
  Test: divisible by 19
    If true: throw to monkey 6
    If false: throw to monkey 0

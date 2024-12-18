input = DATA.read.split("\n")

to_bag = lambda do |line|
  name = line.gsub(/bag(s)?/, '').gsub(/\d+|\./, '').strip.gsub(' ', '_').to_sym
  [name, line.to_i]
end

bags = input.map { |l| l.split('contain') }.each_with_object({}) do |(parent, children), memo|
  next if children =~ /no other/
  memo[to_bag.call(parent).first] = children.split(",").map(&to_bag).map(&:first)
end

traverse = lambda do |bags, keys, start, colors = []|
  return colors.uniq if keys.empty?

  next_key = keys.shift

  if bags[next_key].include?(start)
    colors << next_key
    traverse[bags, bags.keys, next_key, colors]
  end

  traverse[bags, keys, start, colors]
end

# pp bags
# {:light_red    => [:bright_white, :muted_yellow],
#  :dark_orange  => [:bright_white, :muted_yellow],
#  :bright_white => [:shiny_gold],
#  :muted_yellow => [:shiny_gold, :faded_blue],
#  :shiny_gold   => [:dark_olive, :vibrant_plum],
#  :dark_olive   => [:faded_blue, :dotted_black],
#  :vibrant_plum => [:faded_blue, :dotted_black]}

puts 'How many bag colors can eventually contain at least one shiny gold bag?'
p traverse[bags, bags.keys, :shiny_gold].size
# => 337


# part 2
bags = input.map { |l| l.split('contain') }.each_with_object({}) do |(parent, children), memo|
  next if children =~ /no other/
  memo[to_bag.call(parent).first] = children.split(",").map(&to_bag)
end

# pp bags
# {:light_red    => [[:bright_white, 1], [:muted_yellow, 2]],
#  :dark_orange  => [[:bright_white, 3], [:muted_yellow, 4]],
#  :bright_white => [[:shiny_gold, 1]],
#  :muted_yellow => [[:shiny_gold, 2], [:faded_blue, 9]],
#  :shiny_gold   => [[:dark_olive, 1], [:vibrant_plum, 2]],
#  :dark_olive   => [[:faded_blue, 3], [:dotted_black, 4]],
#  :vibrant_plum => [[:faded_blue, 5], [:dotted_black, 6]]}


def traverse_with_weight(bags, queue, sum = 0)
  until queue.empty?
    parent, count = queue.shift
    next if bags[parent].nil?

    bags[parent].each do |child, weight|
      sum += count * weight
      queue << [child, count * weight]
    end
  end

  sum
end

puts 'How many individual bags are required inside your single shiny gold bag?'
puts traverse_with_weight(bags, [[:shiny_gold, 1]])
# => 50100

__END__
dotted blue bags contain 3 wavy bronze bags, 5 clear tomato bags.
mirrored brown bags contain 1 pale teal bag, 3 muted gray bags, 3 dark bronze bags.
shiny violet bags contain 3 vibrant crimson bags.
dotted crimson bags contain 1 posh red bag, 3 dim olive bags.
dotted red bags contain 2 drab white bags, 2 bright cyan bags, 4 bright coral bags, 5 drab maroon bags.
muted beige bags contain 4 clear tomato bags, 1 dotted black bag.
dark lime bags contain 4 light lavender bags, 3 vibrant beige bags, 5 light brown bags.
posh yellow bags contain 4 wavy chartreuse bags, 3 dull white bags, 2 shiny tomato bags, 1 mirrored gray bag.
vibrant turquoise bags contain 5 wavy crimson bags, 5 dim maroon bags, 1 dotted silver bag.
drab brown bags contain 1 vibrant cyan bag.
bright crimson bags contain 2 drab purple bags, 2 faded beige bags, 4 dim turquoise bags.
clear gold bags contain 3 dotted tomato bags, 5 pale magenta bags, 3 clear gray bags.
bright lavender bags contain 1 vibrant silver bag, 5 dotted black bags, 1 dark aqua bag.
faded red bags contain 5 pale white bags.
shiny brown bags contain 2 shiny beige bags, 1 vibrant indigo bag.
dotted teal bags contain 4 clear yellow bags, 1 dim crimson bag, 5 dull teal bags.
wavy orange bags contain 3 wavy green bags, 1 dark chartreuse bag, 5 bright silver bags, 3 dim plum bags.
dull indigo bags contain 2 faded black bags, 2 faded red bags, 4 dim bronze bags.
pale blue bags contain 2 pale fuchsia bags, 5 mirrored bronze bags, 2 faded fuchsia bags.
light lime bags contain 4 pale lime bags, 5 plaid green bags, 3 clear turquoise bags, 3 plaid yellow bags.
faded turquoise bags contain 3 mirrored silver bags.
drab magenta bags contain 2 clear tomato bags.
light maroon bags contain 2 plaid coral bags.
muted orange bags contain 1 muted salmon bag, 3 bright indigo bags, 2 dull maroon bags, 3 muted olive bags.
clear maroon bags contain 5 clear tomato bags, 5 muted tomato bags, 1 wavy silver bag, 4 light brown bags.
dim tomato bags contain 4 dull green bags, 3 wavy bronze bags, 1 dim teal bag, 3 vibrant magenta bags.
muted purple bags contain 4 dim aqua bags.
vibrant coral bags contain 5 light tomato bags, 2 bright tomato bags, 3 muted black bags, 1 plaid indigo bag.
dotted orange bags contain 1 light tomato bag, 1 shiny aqua bag, 4 wavy gold bags.
dim beige bags contain 4 drab blue bags.
dotted black bags contain no other bags.
dark blue bags contain 1 dull crimson bag, 2 muted gray bags.
dim cyan bags contain 1 faded indigo bag, 1 dotted blue bag.
dull violet bags contain 5 wavy plum bags, 3 clear magenta bags.
bright violet bags contain 4 dotted teal bags, 2 pale lime bags.
striped tomato bags contain 2 dim salmon bags, 2 faded white bags, 3 drab violet bags.
plaid bronze bags contain 4 posh red bags.
wavy indigo bags contain 5 drab tomato bags, 3 mirrored olive bags, 3 muted tomato bags.
dull purple bags contain 2 striped orange bags, 5 pale green bags, 2 clear orange bags, 1 dotted violet bag.
striped yellow bags contain 1 posh yellow bag.
mirrored violet bags contain 5 light green bags.
dim blue bags contain 5 faded cyan bags.
posh brown bags contain 3 wavy blue bags.
striped gray bags contain 5 dim tan bags.
drab orange bags contain 1 plaid brown bag, 5 dull tomato bags.
wavy beige bags contain 1 shiny gold bag, 1 dark orange bag, 4 muted lavender bags.
drab beige bags contain 3 dull yellow bags.
dotted aqua bags contain 3 posh tomato bags, 3 dark green bags, 1 light olive bag.
striped black bags contain 5 dull maroon bags.
faded white bags contain 4 posh coral bags, 5 bright lime bags, 5 drab lavender bags, 4 shiny cyan bags.
dotted gold bags contain 4 drab bronze bags, 2 wavy fuchsia bags, 2 bright aqua bags, 2 vibrant brown bags.
muted teal bags contain 1 pale yellow bag, 4 pale beige bags, 1 vibrant olive bag.
dotted chartreuse bags contain 4 dotted fuchsia bags, 5 clear gold bags.
light black bags contain 4 posh coral bags, 3 striped orange bags, 3 dull brown bags.
clear black bags contain 2 vibrant white bags, 4 dull teal bags, 3 mirrored aqua bags, 1 mirrored gold bag.
faded coral bags contain 4 drab gold bags, 4 drab indigo bags, 1 mirrored gold bag, 3 dotted purple bags.
clear fuchsia bags contain 2 drab teal bags, 5 striped beige bags.
light gold bags contain 4 vibrant gray bags.
vibrant indigo bags contain 2 dull tomato bags, 4 plaid white bags.
faded olive bags contain 2 dim lime bags, 5 mirrored crimson bags.
striped purple bags contain 3 mirrored red bags, 3 vibrant yellow bags.
drab tomato bags contain 2 faded violet bags.
drab gray bags contain 3 drab purple bags, 1 shiny gray bag, 5 wavy aqua bags.
vibrant lavender bags contain 1 wavy purple bag, 5 striped gold bags, 4 dim coral bags.
dotted tan bags contain 5 pale fuchsia bags.
bright teal bags contain 1 vibrant yellow bag.
pale olive bags contain 3 striped white bags, 2 vibrant lavender bags, 1 dull orange bag.
shiny bronze bags contain 1 posh maroon bag, 4 plaid blue bags, 5 clear gold bags, 1 drab white bag.
dotted gray bags contain 3 muted olive bags, 3 bright indigo bags, 3 light turquoise bags, 1 muted salmon bag.
pale yellow bags contain 2 light blue bags, 2 pale beige bags.
posh purple bags contain 1 shiny blue bag, 4 striped yellow bags, 3 dim purple bags.
mirrored orange bags contain 4 dotted olive bags, 4 bright turquoise bags, 5 striped violet bags, 4 shiny coral bags.
vibrant black bags contain 3 vibrant olive bags, 5 plaid gold bags.
bright olive bags contain 4 dull teal bags, 2 pale plum bags, 2 dim white bags.
mirrored plum bags contain 3 striped gray bags.
dim brown bags contain 3 striped plum bags.
plaid beige bags contain 5 drab fuchsia bags, 2 dark beige bags, 4 mirrored turquoise bags, 1 mirrored crimson bag.
pale gold bags contain 1 drab fuchsia bag, 5 muted silver bags, 1 drab teal bag, 2 striped brown bags.
vibrant white bags contain 4 dim tan bags, 2 faded violet bags, 5 dim fuchsia bags, 5 muted olive bags.
posh coral bags contain 3 mirrored aqua bags, 1 drab tomato bag.
shiny lavender bags contain 1 plaid violet bag.
drab lavender bags contain 2 dotted coral bags, 2 shiny indigo bags.
drab cyan bags contain 1 dim blue bag, 2 muted silver bags, 5 dark aqua bags.
vibrant plum bags contain 3 shiny green bags, 4 dim white bags, 2 dark turquoise bags.
striped salmon bags contain 3 wavy blue bags.
clear aqua bags contain 3 vibrant aqua bags.
dark cyan bags contain 1 striped green bag.
striped aqua bags contain 5 clear gray bags, 2 clear violet bags, 1 shiny aqua bag, 5 mirrored turquoise bags.
dim silver bags contain 2 drab cyan bags, 3 shiny silver bags, 4 plaid beige bags.
shiny olive bags contain 4 striped green bags, 1 wavy magenta bag, 3 dim teal bags, 5 drab beige bags.
posh salmon bags contain 2 clear turquoise bags.
pale bronze bags contain 2 dull maroon bags.
striped violet bags contain 3 mirrored purple bags, 4 dark orange bags, 2 drab olive bags.
mirrored red bags contain 1 drab black bag, 1 posh blue bag.
clear plum bags contain 4 bright yellow bags, 4 dotted gray bags, 5 plaid aqua bags, 2 light coral bags.
wavy green bags contain 3 mirrored aqua bags, 2 muted black bags, 1 dim blue bag, 5 mirrored turquoise bags.
dull silver bags contain 3 posh lavender bags, 4 vibrant indigo bags.
bright lime bags contain 3 mirrored salmon bags, 3 wavy plum bags, 2 clear tomato bags, 4 mirrored turquoise bags.
muted lime bags contain 3 dark white bags.
plaid fuchsia bags contain 1 light tomato bag, 5 clear maroon bags, 2 bright violet bags.
bright white bags contain 4 dotted green bags, 2 drab brown bags, 2 dotted teal bags, 5 striped cyan bags.
dark tan bags contain 3 muted tan bags.
light crimson bags contain 2 muted olive bags, 5 light tan bags, 5 wavy orange bags.
mirrored chartreuse bags contain 5 plaid chartreuse bags, 4 light aqua bags.
muted blue bags contain 3 shiny purple bags, 3 dotted yellow bags, 5 dull cyan bags, 4 clear gray bags.
mirrored white bags contain 4 shiny yellow bags, 1 wavy silver bag, 1 wavy bronze bag.
dim crimson bags contain 2 drab bronze bags, 3 clear violet bags, 3 shiny indigo bags, 1 vibrant white bag.
plaid gold bags contain 3 drab black bags, 5 clear orange bags, 3 muted cyan bags, 4 dim blue bags.
drab purple bags contain 5 bright cyan bags, 2 dull silver bags.
vibrant magenta bags contain 2 wavy plum bags, 3 pale indigo bags, 1 light turquoise bag, 1 vibrant gold bag.
clear olive bags contain 4 posh gray bags, 3 dark black bags, 1 dark aqua bag.
dotted indigo bags contain 3 vibrant cyan bags, 3 pale fuchsia bags.
wavy aqua bags contain 5 clear bronze bags, 2 clear lavender bags, 1 pale crimson bag.
mirrored tan bags contain 1 dim white bag, 2 dim magenta bags.
dotted lavender bags contain 5 striped tomato bags.
plaid chartreuse bags contain 2 light plum bags, 5 drab chartreuse bags.
light turquoise bags contain 4 plaid white bags, 1 mirrored purple bag.
pale purple bags contain 1 light tomato bag.
posh tomato bags contain 3 bright lime bags.
dark turquoise bags contain 1 clear orange bag, 5 shiny aqua bags, 1 muted coral bag.
muted gold bags contain 2 light salmon bags.
vibrant green bags contain 4 dull tomato bags, 1 drab lavender bag, 2 drab white bags, 4 pale brown bags.
shiny turquoise bags contain 5 muted coral bags, 2 dotted black bags, 2 wavy brown bags.
dotted lime bags contain 5 faded cyan bags.
posh cyan bags contain 4 dull tan bags, 4 wavy plum bags.
muted lavender bags contain 3 muted salmon bags, 5 bright indigo bags, 2 clear bronze bags, 4 striped gold bags.
shiny teal bags contain 2 drab olive bags, 5 pale red bags, 3 dotted red bags, 3 plaid indigo bags.
dull gold bags contain 3 wavy beige bags, 4 dotted tomato bags, 4 posh lavender bags, 1 muted cyan bag.
faded maroon bags contain 5 clear lavender bags, 3 clear teal bags, 5 clear orange bags, 1 bright cyan bag.
light blue bags contain 5 posh red bags, 5 plaid white bags, 4 dark orange bags, 3 striped silver bags.
dark aqua bags contain 4 dark orange bags.
clear violet bags contain no other bags.
dim chartreuse bags contain 3 posh lavender bags, 4 dim tan bags, 4 dotted tomato bags.
posh silver bags contain 5 striped black bags, 1 pale green bag, 4 bright coral bags, 1 plaid olive bag.
plaid purple bags contain 1 shiny coral bag, 1 plaid blue bag, 3 clear brown bags, 4 posh tan bags.
drab salmon bags contain 1 shiny purple bag, 3 muted black bags, 2 faded gold bags.
vibrant bronze bags contain 2 dim lime bags.
dotted salmon bags contain 5 muted black bags, 1 light yellow bag, 2 plaid white bags.
dull aqua bags contain 5 clear black bags, 1 pale gold bag, 2 light turquoise bags, 3 striped tomato bags.
posh magenta bags contain 5 plaid black bags, 1 vibrant coral bag, 2 dim black bags.
drab gold bags contain 3 dim turquoise bags, 1 dotted beige bag, 4 dim olive bags.
posh gray bags contain 4 dotted turquoise bags, 5 plaid gray bags, 5 clear yellow bags.
bright coral bags contain 4 light turquoise bags, 2 shiny gold bags.
dark lavender bags contain 4 faded blue bags.
light teal bags contain 2 posh silver bags, 2 drab maroon bags, 3 dim orange bags.
pale black bags contain 1 striped red bag, 2 plaid lavender bags, 4 dim chartreuse bags, 2 faded black bags.
wavy fuchsia bags contain 3 faded gray bags, 1 muted silver bag, 1 striped plum bag.
wavy lavender bags contain 3 pale magenta bags, 1 clear tan bag.
dotted fuchsia bags contain 5 mirrored purple bags, 3 dotted yellow bags, 3 dark beige bags.
wavy crimson bags contain 3 pale beige bags, 1 vibrant orange bag.
striped plum bags contain 4 wavy bronze bags, 4 muted beige bags, 4 shiny yellow bags.
dull blue bags contain 5 clear tomato bags, 3 shiny indigo bags, 5 dotted cyan bags.
dull red bags contain 3 dim bronze bags, 1 dotted blue bag.
striped teal bags contain 5 pale fuchsia bags, 2 dull silver bags.
dark olive bags contain 2 dotted red bags, 1 dull blue bag.
mirrored coral bags contain 2 clear violet bags, 5 posh tan bags, 1 dim indigo bag, 3 faded cyan bags.
dark maroon bags contain 3 dull coral bags.
dull maroon bags contain 4 dim indigo bags.
vibrant olive bags contain 1 muted olive bag, 5 striped plum bags.
bright beige bags contain 3 muted beige bags, 2 shiny turquoise bags, 1 shiny violet bag, 1 vibrant lime bag.
clear brown bags contain 2 pale teal bags, 3 dull yellow bags, 4 pale red bags, 3 faded violet bags.
vibrant crimson bags contain 4 muted silver bags, 1 shiny yellow bag.
drab indigo bags contain 2 shiny tan bags.
vibrant maroon bags contain 4 vibrant lime bags, 2 clear gold bags.
dark brown bags contain 5 striped brown bags, 3 muted coral bags, 3 dim coral bags.
light red bags contain 5 light blue bags.
posh olive bags contain 4 dim lime bags, 3 mirrored tomato bags, 3 light green bags, 1 dark black bag.
dotted violet bags contain 3 dull orange bags, 4 posh lime bags, 2 dark chartreuse bags, 4 pale tomato bags.
mirrored salmon bags contain 1 pale teal bag.
dull teal bags contain 3 shiny bronze bags, 2 drab tomato bags.
faded silver bags contain 2 clear bronze bags.
vibrant orange bags contain 4 muted salmon bags.
drab black bags contain 2 dull cyan bags, 2 faded violet bags, 2 clear gold bags, 3 clear bronze bags.
posh green bags contain 4 dotted gray bags.
clear orange bags contain 2 muted silver bags, 4 dark orange bags.
mirrored beige bags contain 4 drab crimson bags, 2 muted coral bags.
faded cyan bags contain 3 dim fuchsia bags, 4 clear gray bags.
shiny gray bags contain 3 shiny brown bags.
bright cyan bags contain 5 pale teal bags, 3 wavy beige bags, 2 dotted black bags.
dim gray bags contain 1 wavy purple bag, 4 dotted magenta bags.
clear cyan bags contain 3 plaid violet bags, 3 shiny aqua bags, 3 pale bronze bags, 5 dim black bags.
dotted tomato bags contain 2 dull yellow bags, 1 dark turquoise bag.
faded salmon bags contain 1 posh blue bag, 5 dotted red bags.
faded plum bags contain 3 wavy aqua bags, 3 dim turquoise bags, 1 drab red bag, 4 dark chartreuse bags.
mirrored bronze bags contain 5 shiny turquoise bags, 1 striped purple bag.
dull fuchsia bags contain 4 drab maroon bags, 3 shiny indigo bags, 3 faded cyan bags, 2 striped gray bags.
wavy salmon bags contain 3 striped indigo bags, 1 dim fuchsia bag.
shiny beige bags contain 4 vibrant silver bags, 4 pale crimson bags.
wavy silver bags contain 4 dim red bags, 5 wavy aqua bags.
posh maroon bags contain 1 muted lavender bag.
dim turquoise bags contain 2 muted silver bags.
dotted silver bags contain 4 striped aqua bags, 4 mirrored olive bags, 2 dim lime bags, 3 striped teal bags.
drab white bags contain 2 muted silver bags, 4 posh tan bags, 5 posh red bags, 2 shiny aqua bags.
clear coral bags contain 1 posh plum bag.
light silver bags contain 1 dark orange bag, 4 pale red bags, 3 shiny tan bags, 1 dim indigo bag.
mirrored lime bags contain 2 clear orange bags, 2 drab lavender bags.
clear red bags contain 3 plaid blue bags, 3 light cyan bags.
clear silver bags contain 2 dark white bags, 4 dim chartreuse bags, 1 posh aqua bag, 3 striped maroon bags.
wavy maroon bags contain 2 dotted fuchsia bags, 1 pale beige bag, 5 dull orange bags.
striped silver bags contain 4 muted silver bags, 2 posh tan bags, 4 drab maroon bags, 2 dull tomato bags.
faded black bags contain 3 wavy fuchsia bags.
wavy magenta bags contain 2 vibrant yellow bags, 1 dull coral bag.
mirrored olive bags contain 5 dark chartreuse bags, 4 shiny bronze bags, 3 faded bronze bags.
striped beige bags contain 1 striped brown bag, 5 faded blue bags, 1 muted olive bag.
wavy tan bags contain 1 striped red bag, 2 clear maroon bags.
shiny maroon bags contain 5 striped red bags, 1 bright bronze bag.
light lavender bags contain 1 dull green bag.
dull bronze bags contain 5 pale silver bags, 2 dull brown bags, 5 shiny cyan bags.
pale aqua bags contain 5 pale chartreuse bags.
posh crimson bags contain 1 wavy purple bag, 1 pale plum bag, 2 mirrored red bags, 3 clear tomato bags.
posh chartreuse bags contain 2 plaid gray bags, 3 dotted purple bags, 1 posh plum bag.
dark fuchsia bags contain 1 muted white bag.
bright gold bags contain 1 striped brown bag.
dark violet bags contain 5 shiny purple bags, 5 plaid black bags.
striped lime bags contain 2 bright brown bags, 3 dull olive bags.
plaid tan bags contain 4 clear aqua bags, 3 striped green bags, 3 dark chartreuse bags, 1 posh indigo bag.
dotted magenta bags contain 1 plaid coral bag, 3 muted coral bags.
faded crimson bags contain 1 mirrored yellow bag, 3 dim indigo bags, 3 bright indigo bags, 2 mirrored crimson bags.
bright brown bags contain 5 plaid coral bags.
striped turquoise bags contain 4 wavy aqua bags.
dark purple bags contain 2 striped red bags.
dull magenta bags contain 4 plaid black bags, 5 dark purple bags.
light bronze bags contain 2 clear aqua bags, 4 posh black bags.
vibrant red bags contain 3 mirrored aqua bags, 5 muted chartreuse bags.
dull chartreuse bags contain 5 clear lavender bags, 2 drab indigo bags, 5 light turquoise bags, 5 mirrored red bags.
vibrant silver bags contain 2 muted olive bags, 5 striped violet bags, 2 dim fuchsia bags, 4 light silver bags.
drab fuchsia bags contain 1 dark beige bag.
dull crimson bags contain 2 posh red bags, 1 mirrored crimson bag.
dotted bronze bags contain 3 dotted fuchsia bags, 4 drab maroon bags, 4 faded gold bags, 5 striped brown bags.
clear yellow bags contain 4 mirrored aqua bags, 3 bright cyan bags.
wavy blue bags contain 5 mirrored silver bags, 1 dim chartreuse bag, 1 dull tomato bag, 2 plaid white bags.
faded yellow bags contain 1 wavy orange bag.
posh violet bags contain 4 mirrored turquoise bags.
bright orange bags contain 5 shiny plum bags.
posh turquoise bags contain 3 posh gold bags.
dull gray bags contain 5 muted lime bags, 3 bright beige bags.
drab blue bags contain 3 dim blue bags, 1 clear brown bag, 5 pale teal bags, 5 dotted tomato bags.
shiny aqua bags contain 2 dull yellow bags, 3 faded cyan bags, 5 mirrored turquoise bags, 1 striped silver bag.
dark bronze bags contain 2 striped teal bags.
plaid tomato bags contain 1 dim turquoise bag, 2 dim crimson bags.
shiny tan bags contain 3 dark orange bags, 5 clear bronze bags, 4 striped gold bags, 2 clear violet bags.
clear gray bags contain no other bags.
dotted beige bags contain 5 dim white bags, 5 wavy green bags, 3 dotted tomato bags.
posh beige bags contain 1 striped beige bag, 2 posh blue bags, 1 muted cyan bag, 1 light silver bag.
vibrant purple bags contain 2 drab blue bags, 2 vibrant yellow bags, 4 faded violet bags, 1 clear lavender bag.
wavy brown bags contain 3 clear violet bags.
wavy yellow bags contain 1 vibrant fuchsia bag, 5 dark turquoise bags.
dim white bags contain 2 pale cyan bags, 3 clear brown bags.
bright turquoise bags contain 5 pale salmon bags.
dim aqua bags contain 3 pale turquoise bags.
pale chartreuse bags contain 5 striped bronze bags, 2 drab beige bags, 1 dull black bag, 3 wavy teal bags.
dull orange bags contain 3 pale beige bags.
dark indigo bags contain 5 dim bronze bags, 5 drab teal bags, 5 dark silver bags, 3 striped indigo bags.
muted yellow bags contain 1 plaid red bag, 4 dotted black bags, 4 dark fuchsia bags, 2 faded crimson bags.
plaid red bags contain 1 dark orange bag, 4 dull olive bags, 1 clear gold bag.
light tomato bags contain 1 dotted magenta bag, 5 posh fuchsia bags.
clear bronze bags contain no other bags.
muted coral bags contain 4 plaid violet bags, 2 mirrored purple bags, 5 drab maroon bags, 4 clear gray bags.
dim indigo bags contain 5 faded violet bags.
dark plum bags contain 5 plaid black bags.
light salmon bags contain 3 plaid aqua bags, 3 bright brown bags, 2 striped purple bags.
muted magenta bags contain 3 mirrored turquoise bags, 1 bright coral bag, 5 faded fuchsia bags.
pale turquoise bags contain 4 drab blue bags, 2 dotted purple bags.
wavy chartreuse bags contain 5 dim blue bags.
dull cyan bags contain 4 plaid coral bags, 4 mirrored purple bags, 4 pale fuchsia bags.
plaid cyan bags contain 5 faded beige bags.
dotted plum bags contain 5 faded violet bags, 4 wavy purple bags, 1 shiny lavender bag, 2 pale magenta bags.
faded tomato bags contain 2 light red bags.
plaid silver bags contain 3 light blue bags, 1 posh beige bag.
mirrored green bags contain 1 plaid purple bag, 2 light beige bags, 4 dotted tomato bags.
wavy lime bags contain 5 dotted salmon bags, 2 striped cyan bags, 2 pale white bags.
drab turquoise bags contain 5 shiny chartreuse bags, 2 wavy violet bags, 3 dotted yellow bags, 2 shiny cyan bags.
striped crimson bags contain 2 dark coral bags, 2 clear chartreuse bags, 3 dim magenta bags, 2 plaid fuchsia bags.
shiny green bags contain 3 plaid coral bags, 2 striped aqua bags.
faded teal bags contain 1 light maroon bag, 2 muted plum bags.
light violet bags contain 5 wavy tomato bags, 3 dark green bags, 2 vibrant plum bags.
pale red bags contain 1 plaid white bag, 3 clear bronze bags, 5 clear violet bags.
muted indigo bags contain 2 dotted red bags, 1 dotted tomato bag, 4 mirrored tomato bags, 1 mirrored white bag.
muted fuchsia bags contain 4 mirrored lime bags, 2 dotted teal bags.
shiny gold bags contain 3 striped gold bags, 2 faded violet bags, 3 shiny tan bags, 3 dark turquoise bags.
dark green bags contain 5 drab maroon bags, 2 wavy violet bags.
vibrant gold bags contain 5 dark beige bags, 3 dotted black bags, 5 posh aqua bags.
mirrored cyan bags contain 4 muted chartreuse bags.
drab violet bags contain 4 dull tomato bags, 4 wavy crimson bags, 3 posh crimson bags, 3 mirrored silver bags.
dark crimson bags contain 3 striped cyan bags, 4 vibrant cyan bags.
mirrored tomato bags contain 5 dotted green bags.
dotted brown bags contain 1 pale coral bag, 3 pale plum bags, 1 striped red bag, 2 clear brown bags.
muted black bags contain 2 clear black bags, 1 dark turquoise bag.
faded brown bags contain 5 shiny bronze bags, 2 shiny plum bags, 4 dotted olive bags.
bright silver bags contain 2 light tan bags, 5 posh teal bags.
vibrant fuchsia bags contain 3 wavy beige bags, 2 vibrant violet bags.
light tan bags contain 2 mirrored purple bags, 5 muted orange bags, 4 dark turquoise bags.
vibrant tomato bags contain 4 light brown bags.
light yellow bags contain 4 striped silver bags, 5 clear gray bags.
shiny plum bags contain 3 dotted purple bags, 2 dim tan bags, 1 drab white bag, 4 mirrored salmon bags.
vibrant chartreuse bags contain 1 muted cyan bag, 3 striped tan bags, 4 dotted lavender bags, 5 drab red bags.
mirrored turquoise bags contain 2 dull yellow bags, 3 mirrored purple bags.
shiny salmon bags contain 2 pale bronze bags, 3 vibrant tomato bags, 4 mirrored silver bags, 5 pale cyan bags.
vibrant lime bags contain 1 dim gold bag, 2 shiny indigo bags.
plaid plum bags contain 3 drab crimson bags.
wavy purple bags contain 1 muted beige bag, 5 dark violet bags.
striped lavender bags contain 1 vibrant maroon bag.
faded purple bags contain 2 clear violet bags, 4 dim lime bags.
posh tan bags contain 5 dull tomato bags, 1 plaid white bag, 2 clear bronze bags.
bright green bags contain 3 pale red bags, 1 vibrant chartreuse bag.
bright yellow bags contain 5 posh lime bags, 1 plaid gray bag, 4 clear tan bags, 1 light yellow bag.
plaid yellow bags contain 5 mirrored aqua bags.
plaid indigo bags contain 2 plaid white bags, 3 muted black bags, 4 dark chartreuse bags, 4 plaid aqua bags.
faded violet bags contain 1 plaid violet bag, 3 striped gold bags, 2 clear violet bags, 2 pale red bags.
faded fuchsia bags contain 1 striped lime bag, 2 dark blue bags.
dim lavender bags contain 5 mirrored fuchsia bags.
clear turquoise bags contain 5 pale maroon bags, 1 shiny brown bag, 2 muted blue bags.
wavy bronze bags contain 5 posh lavender bags, 3 dull orange bags, 1 pale crimson bag, 4 drab tomato bags.
bright tan bags contain 1 dull cyan bag, 5 mirrored white bags, 4 clear salmon bags.
posh teal bags contain 2 faded olive bags.
wavy olive bags contain 4 shiny violet bags, 5 faded tomato bags.
bright blue bags contain 5 dull lime bags, 4 light tomato bags, 5 dim fuchsia bags.
pale maroon bags contain 1 dull silver bag, 1 wavy blue bag, 1 pale magenta bag.
dull lavender bags contain 2 drab gray bags, 1 muted brown bag, 2 dark lavender bags, 3 bright magenta bags.
wavy white bags contain 1 plaid red bag.
shiny orange bags contain 1 vibrant beige bag, 1 muted orange bag, 3 striped yellow bags.
mirrored fuchsia bags contain 2 wavy indigo bags.
striped fuchsia bags contain 3 wavy fuchsia bags.
posh aqua bags contain 5 clear bronze bags, 1 pale crimson bag, 1 vibrant silver bag, 5 pale fuchsia bags.
clear salmon bags contain 1 plaid beige bag, 3 vibrant plum bags, 2 striped silver bags, 2 faded beige bags.
striped orange bags contain 1 muted white bag.
drab tan bags contain 3 striped red bags, 3 light beige bags.
mirrored gold bags contain 1 faded violet bag, 4 mirrored turquoise bags.
muted olive bags contain 4 light yellow bags, 3 light turquoise bags, 5 clear violet bags, 2 vibrant indigo bags.
pale violet bags contain 3 posh turquoise bags.
pale tomato bags contain 3 clear orange bags, 3 bright cyan bags, 5 faded gold bags.
striped red bags contain 5 dotted chartreuse bags, 3 wavy tomato bags, 3 dull gold bags, 1 wavy beige bag.
dull plum bags contain 3 posh bronze bags, 2 dim maroon bags, 3 bright black bags.
light purple bags contain 1 muted orange bag.
bright gray bags contain 3 vibrant olive bags, 4 clear turquoise bags.
pale crimson bags contain 4 muted salmon bags, 5 bright brown bags, 1 pale beige bag.
pale lime bags contain 5 pale cyan bags.
drab red bags contain 1 muted olive bag.
pale salmon bags contain 3 faded chartreuse bags.
faded magenta bags contain 4 posh black bags, 4 drab aqua bags.
dotted yellow bags contain 1 plaid black bag.
dim coral bags contain 1 mirrored silver bag.
wavy plum bags contain 2 mirrored turquoise bags.
muted red bags contain 4 shiny bronze bags.
dull yellow bags contain no other bags.
dotted maroon bags contain 1 dull yellow bag, 5 bright gray bags, 3 shiny violet bags, 1 faded gray bag.
dark silver bags contain 2 clear gray bags, 2 drab white bags, 2 dark turquoise bags, 3 pale indigo bags.
dull olive bags contain 1 dull white bag, 5 light turquoise bags.
dim lime bags contain 1 dull tomato bag, 1 striped gold bag, 1 plaid violet bag.
posh lime bags contain 2 dark beige bags, 3 dim coral bags, 1 wavy blue bag, 5 clear tomato bags.
dark beige bags contain 1 plaid coral bag, 4 drab bronze bags, 1 vibrant cyan bag.
dark yellow bags contain 1 faded olive bag, 3 shiny lavender bags, 2 plaid silver bags, 2 pale red bags.
bright bronze bags contain 5 posh crimson bags.
shiny lime bags contain 3 vibrant olive bags, 5 clear gold bags, 5 striped indigo bags.
dotted green bags contain 1 vibrant silver bag, 3 dotted blue bags, 5 clear brown bags.
mirrored black bags contain 1 pale crimson bag, 1 dark lavender bag, 4 dark gray bags, 1 light orange bag.
plaid blue bags contain 5 clear bronze bags, 3 clear gray bags.
pale indigo bags contain 1 muted olive bag, 4 shiny gold bags.
plaid salmon bags contain 3 posh red bags, 3 vibrant blue bags, 3 plaid gold bags, 2 dull brown bags.
drab green bags contain 5 mirrored purple bags, 4 dull maroon bags, 1 posh beige bag, 2 mirrored red bags.
pale gray bags contain 4 dark indigo bags.
posh fuchsia bags contain 1 shiny tan bag, 3 clear tomato bags.
dim maroon bags contain 2 drab crimson bags.
plaid crimson bags contain 1 dotted white bag, 4 faded chartreuse bags, 4 dim maroon bags.
dark white bags contain 5 mirrored aqua bags, 4 wavy orange bags, 3 clear lavender bags.
posh plum bags contain 5 bright lime bags.
pale tan bags contain 3 plaid orange bags, 5 muted cyan bags.
light indigo bags contain 4 clear blue bags, 1 wavy salmon bag.
dark magenta bags contain 1 muted maroon bag, 5 plaid violet bags.
posh indigo bags contain 1 posh teal bag.
striped white bags contain 4 posh teal bags.
dull white bags contain 1 plaid violet bag, 1 drab plum bag.
faded green bags contain 3 shiny chartreuse bags, 5 pale turquoise bags, 1 plaid gray bag, 1 dotted black bag.
faded chartreuse bags contain 1 striped silver bag, 5 drab white bags, 4 dotted green bags.
vibrant beige bags contain 2 dull turquoise bags.
faded tan bags contain 5 posh indigo bags.
dark orange bags contain no other bags.
striped coral bags contain 4 dark crimson bags, 5 vibrant crimson bags, 2 shiny aqua bags, 5 wavy coral bags.
dim plum bags contain 3 faded blue bags, 5 faded gold bags.
dim red bags contain 2 dotted olive bags, 5 light silver bags, 5 mirrored crimson bags.
pale teal bags contain 2 pale magenta bags, 1 drab olive bag.
dull turquoise bags contain 5 drab purple bags, 4 pale tomato bags.
dark red bags contain 4 light yellow bags, 2 dotted tomato bags, 3 dotted coral bags, 5 faded olive bags.
mirrored magenta bags contain 1 shiny lavender bag, 4 shiny red bags, 5 dotted beige bags.
dim black bags contain 3 dull salmon bags, 1 wavy purple bag.
mirrored blue bags contain 2 vibrant green bags, 1 dull teal bag, 2 shiny turquoise bags.
dotted turquoise bags contain 3 clear lavender bags.
shiny fuchsia bags contain 1 clear beige bag, 3 dotted olive bags, 4 vibrant white bags, 1 bright tomato bag.
drab bronze bags contain 4 clear teal bags, 1 muted silver bag.
shiny yellow bags contain 1 pale yellow bag.
dim bronze bags contain 1 pale silver bag, 4 dull tan bags, 3 striped silver bags, 4 pale brown bags.
shiny magenta bags contain 4 wavy olive bags, 3 shiny gray bags, 2 drab magenta bags, 2 posh indigo bags.
shiny white bags contain 4 shiny salmon bags, 3 mirrored bronze bags.
muted tan bags contain 4 dull fuchsia bags.
dull black bags contain 2 mirrored purple bags.
dark black bags contain 5 light blue bags, 3 vibrant silver bags.
plaid gray bags contain 2 wavy blue bags, 5 dim turquoise bags, 5 mirrored salmon bags, 3 pale gold bags.
dull coral bags contain 5 drab cyan bags, 1 shiny aqua bag, 4 vibrant gray bags, 4 mirrored turquoise bags.
plaid coral bags contain 5 muted silver bags, 5 vibrant indigo bags, 2 dark orange bags, 3 mirrored purple bags.
shiny indigo bags contain 2 dotted gray bags, 4 muted olive bags, 4 dull tomato bags, 2 light silver bags.
bright fuchsia bags contain 4 vibrant brown bags, 3 faded coral bags.
wavy turquoise bags contain 3 drab chartreuse bags, 2 bright coral bags, 3 dark silver bags.
light magenta bags contain 4 bright olive bags, 3 dotted turquoise bags, 4 dim lime bags.
dark teal bags contain 2 dark blue bags, 1 light tan bag.
faded blue bags contain 1 posh red bag.
bright black bags contain 5 dotted gray bags, 2 pale magenta bags.
pale green bags contain 3 bright crimson bags.
striped indigo bags contain 3 bright indigo bags, 3 dotted blue bags.
light beige bags contain 4 dotted magenta bags.
pale cyan bags contain 1 light turquoise bag.
muted crimson bags contain 2 clear lavender bags, 2 pale blue bags, 3 light red bags.
pale coral bags contain 5 vibrant maroon bags, 4 drab teal bags, 2 dim fuchsia bags.
dull brown bags contain 3 pale magenta bags, 2 bright lime bags, 3 striped cyan bags.
drab olive bags contain 1 drab maroon bag, 3 light turquoise bags.
plaid white bags contain no other bags.
bright aqua bags contain 1 dull coral bag, 2 dotted chartreuse bags, 2 faded bronze bags.
clear green bags contain 1 plaid salmon bag, 2 wavy violet bags, 5 posh beige bags.
clear chartreuse bags contain 3 mirrored white bags, 1 dotted blue bag, 3 dull brown bags, 5 drab beige bags.
bright plum bags contain 2 pale chartreuse bags, 4 muted maroon bags, 2 dark salmon bags.
light olive bags contain 3 wavy cyan bags, 1 dark teal bag, 2 drab fuchsia bags.
clear teal bags contain 2 mirrored turquoise bags.
muted green bags contain 2 mirrored purple bags, 5 wavy turquoise bags.
drab coral bags contain 3 dim bronze bags, 1 posh indigo bag, 2 shiny green bags, 4 mirrored olive bags.
clear beige bags contain 1 drab magenta bag.
drab teal bags contain 1 bright brown bag.
dark gold bags contain 4 dark crimson bags.
striped maroon bags contain 2 striped silver bags, 2 posh lavender bags.
light fuchsia bags contain 5 drab violet bags, 5 bright black bags, 5 plaid tan bags.
pale beige bags contain 1 posh maroon bag, 3 striped aqua bags, 4 mirrored purple bags, 1 shiny gold bag.
plaid teal bags contain 2 posh brown bags, 4 pale tomato bags, 4 shiny indigo bags.
shiny chartreuse bags contain 4 muted gray bags, 3 pale indigo bags.
plaid olive bags contain 1 dull gold bag, 4 clear cyan bags.
dim magenta bags contain 5 vibrant yellow bags.
posh orange bags contain 2 dull lime bags, 5 posh maroon bags, 3 posh chartreuse bags, 5 wavy olive bags.
dotted coral bags contain 1 muted cyan bag.
bright indigo bags contain 5 muted coral bags, 5 drab olive bags, 1 dark orange bag, 2 striped gold bags.
drab lime bags contain 4 light turquoise bags, 4 vibrant indigo bags, 4 pale fuchsia bags.
mirrored gray bags contain 4 plaid black bags, 3 striped blue bags, 1 dark orange bag.
dark tomato bags contain 1 faded white bag, 4 light purple bags, 5 dark fuchsia bags, 2 dotted salmon bags.
striped olive bags contain 3 pale red bags, 1 dull yellow bag.
posh bronze bags contain 3 light plum bags, 4 dim beige bags, 3 striped gray bags.
striped tan bags contain 5 plaid white bags, 1 mirrored coral bag, 4 dull brown bags, 3 dull silver bags.
muted white bags contain 4 pale yellow bags.
plaid black bags contain 3 drab white bags, 1 pale red bag, 3 clear gray bags.
muted maroon bags contain 4 clear aqua bags.
pale lavender bags contain 3 faded indigo bags.
dull lime bags contain 2 faded red bags, 2 dull bronze bags, 2 muted turquoise bags, 5 posh gold bags.
dim salmon bags contain 3 wavy brown bags, 4 vibrant olive bags, 4 faded violet bags.
light cyan bags contain 4 shiny plum bags, 5 mirrored fuchsia bags.
vibrant tan bags contain 3 dim cyan bags, 4 pale gray bags, 4 wavy plum bags.
bright salmon bags contain 2 drab teal bags, 2 dotted fuchsia bags, 2 dull brown bags.
vibrant salmon bags contain 3 faded purple bags, 4 shiny indigo bags.
light gray bags contain 5 dim teal bags, 4 striped maroon bags.
striped brown bags contain 2 bright indigo bags, 1 wavy plum bag, 1 striped violet bag, 2 dim indigo bags.
clear lime bags contain 4 muted olive bags, 5 shiny crimson bags, 2 drab salmon bags, 5 dull black bags.
dotted purple bags contain 4 clear orange bags, 4 striped gold bags, 5 drab maroon bags.
shiny purple bags contain 4 plaid brown bags.
pale white bags contain 3 shiny tan bags, 2 striped beige bags, 1 mirrored coral bag.
mirrored purple bags contain no other bags.
dull salmon bags contain 1 striped blue bag, 3 shiny purple bags, 2 plaid red bags, 2 dim fuchsia bags.
dark chartreuse bags contain 4 muted chartreuse bags, 4 vibrant white bags, 4 dotted blue bags, 2 clear gray bags.
light coral bags contain 1 faded tomato bag.
wavy violet bags contain 5 clear orange bags, 4 mirrored turquoise bags, 1 striped brown bag.
dark coral bags contain 2 clear lavender bags, 3 clear gold bags, 4 dotted olive bags.
bright red bags contain 2 faded crimson bags, 5 wavy tomato bags, 3 posh brown bags.
muted bronze bags contain 3 mirrored gold bags.
mirrored maroon bags contain 2 wavy tomato bags, 2 mirrored indigo bags, 3 striped violet bags.
drab yellow bags contain 4 light fuchsia bags, 4 dull yellow bags, 3 dull olive bags, 5 striped red bags.
light plum bags contain 3 mirrored silver bags, 5 drab olive bags.
striped green bags contain 1 plaid brown bag, 2 dark black bags, 1 drab beige bag.
plaid violet bags contain no other bags.
clear blue bags contain 1 pale gold bag, 5 dim aqua bags.
posh white bags contain 4 striped tan bags, 3 posh tomato bags.
plaid lime bags contain 2 muted black bags, 2 bright bronze bags, 3 light chartreuse bags, 2 dull orange bags.
vibrant yellow bags contain 3 faded green bags, 2 clear black bags.
light orange bags contain 5 light yellow bags, 3 faded red bags, 2 striped maroon bags, 3 muted teal bags.
wavy teal bags contain 2 pale teal bags.
drab crimson bags contain 3 muted lime bags, 2 shiny lavender bags.
shiny cyan bags contain 3 bright cyan bags, 4 shiny tomato bags, 5 bright silver bags, 1 mirrored silver bag.
mirrored yellow bags contain 2 shiny beige bags, 3 dark green bags.
drab silver bags contain 1 dim coral bag, 5 faded aqua bags, 3 plaid salmon bags.
faded indigo bags contain 5 dotted purple bags, 5 dotted coral bags, 1 plaid coral bag, 3 bright cyan bags.
wavy red bags contain 4 mirrored black bags, 2 wavy lime bags, 5 vibrant red bags.
dim gold bags contain 2 bright coral bags, 3 pale yellow bags, 1 pale silver bag.
dim fuchsia bags contain 4 plaid white bags, 1 light turquoise bag, 5 faded violet bags, 5 mirrored purple bags.
dark gray bags contain 3 bright brown bags, 4 pale red bags.
muted tomato bags contain 3 drab plum bags, 5 bright lime bags.
dim green bags contain 4 shiny brown bags.
shiny black bags contain 2 clear plum bags, 4 light olive bags.
light green bags contain 3 light silver bags, 1 muted gray bag.
mirrored indigo bags contain 3 bright salmon bags, 2 dim gold bags, 4 bright tomato bags.
striped magenta bags contain 4 clear tan bags, 1 posh chartreuse bag, 3 dim lime bags, 3 wavy green bags.
wavy coral bags contain 1 dull yellow bag.
faded beige bags contain 5 shiny gray bags.
dim olive bags contain 4 dim plum bags, 5 dull yellow bags, 5 dark lavender bags.
light chartreuse bags contain 2 shiny tan bags.
clear purple bags contain 5 vibrant indigo bags, 1 bright coral bag, 5 dotted yellow bags, 1 drab maroon bag.
wavy cyan bags contain 4 clear black bags.
muted chartreuse bags contain 4 clear tomato bags, 2 pale red bags, 2 striped violet bags.
posh blue bags contain 5 wavy violet bags, 3 shiny green bags, 5 muted gray bags.
dim purple bags contain 3 light plum bags, 5 posh lime bags, 2 mirrored gray bags.
faded lavender bags contain 5 pale maroon bags, 5 light orange bags, 1 clear maroon bag, 1 dotted violet bag.
pale magenta bags contain 4 vibrant cyan bags, 2 wavy plum bags.
posh red bags contain no other bags.
pale silver bags contain 2 vibrant cyan bags, 2 dim blue bags, 3 pale plum bags.
dull beige bags contain 2 pale tan bags.
clear tomato bags contain 3 drab tomato bags, 1 pale white bag, 1 shiny aqua bag.
light white bags contain 5 dark gray bags, 1 mirrored black bag, 3 dotted gold bags, 1 pale red bag.
wavy gray bags contain 1 bright magenta bag, 3 pale maroon bags.
wavy tomato bags contain 1 dull silver bag, 1 pale white bag.
plaid orange bags contain 1 pale fuchsia bag, 1 dark green bag.
light brown bags contain 4 striped cyan bags, 4 pale yellow bags, 5 dull teal bags, 4 bright indigo bags.
posh lavender bags contain 1 dull maroon bag, 5 vibrant indigo bags, 2 dull tomato bags.
pale orange bags contain 3 plaid violet bags.
mirrored crimson bags contain 2 dark orange bags, 3 drab maroon bags.
faded bronze bags contain 3 dark crimson bags, 5 muted beige bags, 4 muted coral bags, 3 mirrored crimson bags.
pale brown bags contain 5 mirrored turquoise bags, 5 dull yellow bags.
plaid maroon bags contain 1 dim lime bag.
dim tan bags contain 5 posh maroon bags, 1 vibrant indigo bag, 4 mirrored silver bags.
muted gray bags contain 5 shiny aqua bags, 5 bright indigo bags, 5 dotted tomato bags, 4 mirrored silver bags.
bright chartreuse bags contain 1 mirrored turquoise bag.
muted silver bags contain 3 mirrored turquoise bags, 4 dotted black bags, 5 clear bronze bags, 5 dark orange bags.
vibrant brown bags contain 2 pale silver bags, 1 striped beige bag, 2 vibrant olive bags.
dim orange bags contain 3 vibrant gold bags.
mirrored aqua bags contain 5 dull tomato bags, 1 faded olive bag, 2 posh red bags, 1 muted olive bag.
plaid turquoise bags contain 2 dull teal bags, 2 drab maroon bags, 3 light tomato bags.
muted aqua bags contain 4 bright yellow bags, 5 dotted coral bags, 1 mirrored plum bag.
mirrored silver bags contain 2 vibrant cyan bags, 2 striped silver bags, 3 shiny gold bags.
muted salmon bags contain 1 clear orange bag, 1 muted coral bag, 4 clear bronze bags, 3 striped silver bags.
vibrant aqua bags contain 3 dotted purple bags, 1 striped teal bag.
clear lavender bags contain 1 pale magenta bag, 2 mirrored silver bags, 2 dull tomato bags, 2 clear violet bags.
shiny coral bags contain 4 muted lavender bags, 4 clear gray bags.
shiny blue bags contain 4 vibrant black bags, 3 dark red bags, 2 shiny bronze bags, 2 wavy turquoise bags.
vibrant gray bags contain 3 dotted red bags, 2 posh lavender bags, 4 striped gray bags, 1 shiny brown bag.
clear crimson bags contain 5 faded red bags.
muted turquoise bags contain 3 dark aqua bags, 1 faded bronze bag, 4 pale crimson bags, 5 faded violet bags.
muted brown bags contain 2 muted cyan bags, 5 striped gray bags, 1 vibrant lime bag.
mirrored teal bags contain 3 muted orange bags.
shiny crimson bags contain 2 wavy bronze bags, 1 wavy violet bag, 2 dark lavender bags, 2 drab bronze bags.
dull green bags contain 1 posh red bag, 2 dotted indigo bags.
clear tan bags contain 2 plaid gray bags.
shiny red bags contain 2 drab salmon bags, 4 dotted beige bags, 2 dull silver bags.
pale plum bags contain 5 mirrored turquoise bags.
shiny silver bags contain 3 vibrant yellow bags, 5 dotted indigo bags, 3 dotted chartreuse bags.
plaid lavender bags contain 4 dark plum bags, 2 mirrored bronze bags, 5 posh yellow bags, 3 dull bronze bags.
drab chartreuse bags contain 3 dull yellow bags, 5 clear tomato bags, 4 plaid violet bags, 2 dull maroon bags.
faded gold bags contain 5 dim fuchsia bags, 4 clear orange bags, 5 light green bags, 2 wavy blue bags.
plaid magenta bags contain 4 bright silver bags.
bright purple bags contain 4 muted orange bags.
clear indigo bags contain 5 dim turquoise bags.
drab plum bags contain 1 drab beige bag.
striped bronze bags contain 2 dim blue bags, 3 muted tomato bags.
plaid aqua bags contain 1 bright brown bag.
striped chartreuse bags contain 2 shiny green bags.
mirrored lavender bags contain 4 dull lime bags.
muted cyan bags contain 5 clear orange bags.
dotted cyan bags contain 3 posh fuchsia bags, 3 plaid coral bags.
vibrant blue bags contain 5 dotted beige bags, 3 mirrored red bags.
dim yellow bags contain 5 dim beige bags, 1 vibrant white bag, 1 striped violet bag, 4 muted chartreuse bags.
striped cyan bags contain 2 drab bronze bags, 5 striped silver bags.
posh gold bags contain 3 dim turquoise bags, 4 shiny bronze bags, 1 dark chartreuse bag.
bright tomato bags contain 1 pale maroon bag, 5 dull turquoise bags, 3 wavy plum bags.
bright magenta bags contain 1 vibrant aqua bag, 5 dull olive bags, 1 shiny crimson bag.
vibrant cyan bags contain 5 muted silver bags, 2 dull tomato bags, 1 clear gray bag, 1 drab maroon bag.
plaid brown bags contain 5 clear violet bags, 1 dark black bag.
drab maroon bags contain 2 plaid violet bags, 5 plaid white bags, 1 dark orange bag, 2 striped gold bags.
plaid green bags contain 2 pale tomato bags, 4 mirrored gold bags, 3 mirrored brown bags.
vibrant teal bags contain 5 light salmon bags, 5 dim salmon bags.
bright maroon bags contain 5 dull crimson bags.
faded aqua bags contain 5 muted olive bags.
faded lime bags contain 4 dark indigo bags, 2 pale plum bags, 4 dim tomato bags.
dim teal bags contain 2 bright olive bags, 2 clear violet bags, 4 shiny aqua bags.
dull tomato bags contain 2 dotted black bags, 3 mirrored turquoise bags, 1 striped gold bag, 2 clear bronze bags.
muted violet bags contain 3 dull yellow bags.
dotted white bags contain 2 posh purple bags, 1 muted chartreuse bag, 1 drab violet bag, 1 wavy blue bag.
dark salmon bags contain 3 faded cyan bags.
faded gray bags contain 4 shiny turquoise bags, 3 posh lime bags.
clear magenta bags contain 2 drab indigo bags, 4 pale crimson bags, 5 light turquoise bags.
dull tan bags contain 4 bright silver bags, 3 clear gray bags, 3 dark plum bags, 2 plaid blue bags.
drab aqua bags contain 2 drab plum bags, 1 dull turquoise bag, 4 faded cyan bags.
faded orange bags contain 4 dim cyan bags.
posh black bags contain 1 clear gray bag, 1 striped brown bag, 4 mirrored bronze bags.
light aqua bags contain 3 mirrored aqua bags, 2 clear lavender bags.
clear white bags contain 5 drab maroon bags, 5 posh bronze bags, 3 posh gold bags, 5 dark white bags.
pale fuchsia bags contain 3 clear gray bags, 2 clear violet bags, 5 striped gold bags.
muted plum bags contain 5 vibrant crimson bags.
striped blue bags contain 4 mirrored red bags, 4 shiny silver bags, 3 pale turquoise bags, 3 plaid violet bags.
vibrant violet bags contain 1 bright coral bag.
dim violet bags contain 4 pale teal bags, 1 faded orange bag, 4 vibrant gray bags, 4 dotted salmon bags.
dotted olive bags contain 4 mirrored salmon bags.
striped gold bags contain 2 clear gray bags, 2 dull yellow bags, 1 dotted black bag, 4 posh red bags.
wavy gold bags contain 3 bright yellow bags, 3 shiny beige bags.
shiny tomato bags contain 1 dark turquoise bag, 4 vibrant cyan bags, 4 dotted olive bags, 2 wavy plum bags.
wavy black bags contain 4 dotted indigo bags, 1 light tan bag, 5 bright cyan bags.

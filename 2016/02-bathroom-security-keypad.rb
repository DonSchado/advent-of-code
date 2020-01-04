
Keypad = Struct.new(:layout, :x, :y, :instructions) do
  def code
    instructions.each_with_object([]) do |line, digits|
      line.split('').each do |move|
        case move
          when 'R' then self.x += 1 if key?(x+1, y)
          when 'D' then self.y += 1 if key?(x, y+1)
          when 'L' then self.x -= 1 if key?(x-1, y) && x.nonzero?
          when 'U' then self.y -= 1 if key?(x, y-1) && y.nonzero?
        end
      end

      digits << key
    end.join
  end

  private

  def key?(x, y)
    !!layout[y]&.at(x)
  end

  def key
    layout[y][x]
  end
end


instructions = DATA.read.chomp.split("\n")

# part 1
#
# 1 2 3
# 4 5 6
# 7 8 9
layout = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
]
puts 'simple bathroom code:'
puts Keypad.new(layout, 1, 1, %w[ULL RRDDD LURDL UUUUD]).code # => 1985
puts Keypad.new(layout, 1, 1, instructions).code # => 78293


# part 2
#
#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#     D
layout = [
  [nil , nil,  1 , nil, nil],
  [nil ,  2 ,  3 ,  4 , nil],
  [ 5  ,  6 ,  7 ,  8 ,  9 ],
  [nil , 'A', 'B', 'C', nil],
  [nil , nil, 'D', nil, nil],
]
puts 'advanced bathroom code:'
puts Keypad.new(layout, 0, 2, %w[ULL RRDDD LURDL UUUUD]).code # => 5DB3
puts Keypad.new(layout, 2, 2, %w[LL RRUU DDRR LLDD]).code # => 519D
puts Keypad.new(layout, 0, 2, instructions).code # => AC8C8

__END__
UUURRRRULRDLRDRRDURDDDLLDLLLULDUDDLDLULUURULRLDLRRLLLRRDRRLDDLLULUDUDDLRDRDUURDLURUURLRULLDDURULRRURDUURLULUUUURDDDDUUDLULRULLLRLLRRRURDLLRLLRRRUURULRDRUUDDDDDLLLRURRURRUURDUURDDRDLULRRLLLDRRRLURRLLURLDRRDDLDLRRLLRDRLLLLDLULDLRRDRRLDDURLULLUDLUDRRDRRLRLULURDRLRLUUUDLRLDLLLURDUDULULDDRUUURLLLDLLDDUDDRURURUDDLUULRDRRRRLDRDDURLUDURDULLDLUDLULDRLRLLRLLLLRURDURLLDRRDRLRUUUUULLLRUDURUDLLLUDLLLLRDLDRDUDRURLUDDUDDURLUUUUDDLLUDLULLLLLDUDLLRLRRDDDULULRLDRLLULDLUDLLURULRDDUURULRDLDLDLRL
URUUURDULUDLUUUUDDRRRDRRRLDUDLRDRRDRDDLRUULDLLDUDULLLRLDRDRRLDLDLUUDRUULDUDULDUDURURDDURULDLURULRLULDUDDUULDLLLDDURDDRDDURUULUUDRLDDULDRRRRDURRUDLLLURDDDLRULLRDDRDDDDLUUDRDUULRRRRURULDDDLDDRDRRUDRRURUDRDDLDRRRLLURURUULUUDRDULLDRLRDRRDDURDUDLDRLUDRURDURURULDUUURDUULRRRRRUDLLULDDDRLULDDULUDRRRDDRUDRRDLDLRUULLLLRRDRRLUDRUULRDUDRDRRRDDRLLRUUDRLLLUDUDLULUUDULDRRRRDDRURULDULLURDLLLDUUDLLUDRLDURRRLDDDURUDUDURRULDD
LRUDDULLLULRLUDUDUDRLLUUUULLUDLUUUUDULLUURDLLRDUDLRUDRUDDURURRURUDLLLRLDLUDRRRRRRDLUURLRDDDULRRUDRULRDRDDUULRDDLDULDRRRDDLURRURLLLRURDULLRUUUDDUDUURLRLDDUURLRDRRLURLDRLLUUURDRUUDUUUDRLURUUUDLDRRLRLLRRUURULLLRLLDLLLDULDDLDULDLDDRUDURDDURDUDURDLLLRRDDLULLLUDURLUDDLDLUUDRDRUDUUDLLDDLLLLDRDULRDLDULLRUDDUULDUDLDDDRUURLDRRLURRDDRUUDRUDLLDLULLULUDUDURDDRLRDLRLDRLDDRULLLRUDULDRLRLRULLRLLRRRLLRRRDDRULRUURRLLLRULDLUDRRDDLLLUDDUDDDLURLUDRDLURUUDLLDLULURRLLDURUDDDDRLULRDDLRLDDLRLLDDRRLRDUDUUULRRLRULUDURDUDRLRLRUDUDLLRRRRLRRUDUL
RULLLLUUUDLLDLLRULLRURRULDDRDLUULDRLLRUDLLRRLRDURLLDUUUUURUUURDLUURRLDDDLRRRRLRULDUDDLURDRRUUDLRRRDLDDUDUDDRUDURURLDULLDLULDLLUDLULRDRLLURRLLDURLDLRDLULUDDULDLDDDDDUURRDRURLDLDULLURDLLDDLLUDLDLDRLRLDLRDRLDLRRUUDRURLUUUDLURUULDUDRDULLDURUDLUUURRRLLDUDUDDUUULLLRUULDLURUDDRLUDRDDLDLLUDUDRRRDDUUULUULLLRLLUURDUUDRUUULULLDLDRUUDURLLUULRLDLUURLLUUDRURDDRLURULDUDUUDRRUUURDULRLDUUDDRURURDRRULDDDRLUDLLUUDURRRLDLRLRDRURLURLLLRLDDLRRLDLDDURDUUDRDRRLDRLULDRLURUUUDDRLLLDDLDURLLLLDRDLDRRUDULURRLULRDRLLUULLRLRDRLLULUURRUDRUDDDLLDURURLURRRDLLDRDLUDRULULULRLDLRRRUUDLULDURLRDRLULRUUURRDDLRUURUDRURUDURURDD
DURRDLLLDDLLDLLRLULULLRDLDRRDDRDLRULURRDUUDDRLLDDLDRRLRDUDRULDLRURDUUDRDDLLDRRDRUDUDULLDDDDLDRRRLRLRDRDLURRDDLDDDUUDRDRLLLDLUDDDLUULRDRLLLRLLUULUDDDRLDUUUURULRDDURRDRLUURLUDRLRLLLDDLRDDUULRRRRURDLDDDRLDLDRRLLDRDDUDDUURDLDUUDRDLDLDDULULUDDLRDDRLRLDDLUDLLDRLUDUDDRULLRLDLLRULRUURDDRDRDRURDRRLRDLLUDDRRDRRLDDULLLDLUDRRUDLDULDRURRDURLURRLDLRDLRUDLULUDDRULRLLDUURULURULURRLURRUULRULRRRLRDLULRLRLUDURDDRUUURDRLLRRRDDLDRRRULLDLRDRULDRRLRRDLUDDRDDDUUURRLULLDRRUULULLRRRRLDDRDDLUURLLUDLLDUDLULUULUDLLUUURRRUDDDRLLLRDRUUDUUURDRULURRLRDLLUURLRDURULDRRUDURRDDLDRLDRUUDRLLUDLRRU
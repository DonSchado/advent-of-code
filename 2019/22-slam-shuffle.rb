# part 1

Shuffler = Struct.new(:deck) do
  def cut(n)
    if n.positive?
      top = deck.slice!(0, n)
      self.deck.concat(top)
    else
      bottom = self.deck.slice!(n..-1)
      self.deck = bottom.concat(deck)
    end
  end

  def deal_with_increment(mod)
    shuffled = deck.each_with_index.each_with_object([]) do |(card, i), table|
      table[i * mod % deck.size] = card
    end

    self.deck = shuffled
  end

  def deal_into_new_stack
    self.deck.reverse!
  end
end

# EXAMPLES:
shuffler = Shuffler.new((0..9).to_a)
shuffler.deal_with_increment 7
shuffler.deal_into_new_stack
shuffler.deal_into_new_stack
pp shuffler.deck == [0, 3, 6, 9, 2, 5, 8, 1, 4, 7]

shuffler = Shuffler.new((0..9).to_a)
shuffler.cut 6
shuffler.deal_with_increment 7
shuffler.deal_into_new_stack
pp shuffler.deck == [3, 0, 7, 4, 1, 8, 5, 2, 9, 6]

shuffler = Shuffler.new((0..9).to_a)
shuffler.deal_with_increment 7
shuffler.deal_with_increment 9
shuffler.cut -2
pp shuffler.deck == [6, 3, 0, 7, 4, 1, 8, 5, 2, 9]

shuffler = Shuffler.new((0..9).to_a)
shuffler.deal_into_new_stack
shuffler.cut -2
shuffler.deal_with_increment 7
shuffler.cut 8
shuffler.cut -4
shuffler.deal_with_increment 7
shuffler.cut 3
shuffler.deal_with_increment 9
shuffler.deal_with_increment 3
shuffler.cut -1
pp shuffler.deck == [9, 2, 5, 8, 1, 4, 7, 0, 3, 6]


# INPUT
techniques = DATA.read.chomp.split("\n").map do |technique|
  arg = technique.scan(/.-?\d+/).first

  if arg
    [ technique.sub!(*arg, '').gsub(' ', '_').to_sym, arg.to_i ]
  else
    technique.gsub(' ', '_').to_sym
  end
end

shuffler = Shuffler.new((0..10006).to_a)

techniques.each do |technique, arg|
  if arg
    shuffler.public_send(technique, arg)
  else
    shuffler.public_send(technique)
  end
end

puts 'position of card 2019:'
pp shuffler.deck.index(2019)
# => 1879

__END__
deal into new stack
cut -2732
deal into new stack
deal with increment 57
cut 5974
deal into new stack
deal with increment 32
cut -1725
deal with increment 24
cut 6093
deal with increment 6
cut -2842
deal with increment 14
cut 2609
deal with increment 12
cut -6860
deal with increment 51
cut -6230
deal with increment 61
cut 3152
deal with increment 28
cut 2202
deal into new stack
deal with increment 60
cut 433
deal into new stack
cut -6256
deal with increment 13
deal into new stack
cut 8379
deal into new stack
deal with increment 54
cut 1120
deal with increment 16
cut -5214
deal with increment 63
deal into new stack
cut -8473
deal with increment 11
cut 228
deal with increment 45
cut -6755
deal with increment 50
cut -3391
deal with increment 44
cut -1341
deal with increment 28
cut -6788
deal with increment 52
cut 3062
deal with increment 41
cut 4541
deal with increment 57
cut -7962
deal with increment 56
cut 9621
deal with increment 57
cut 3881
deal with increment 36
deal into new stack
deal with increment 45
cut 522
deal with increment 9
deal into new stack
deal with increment 60
deal into new stack
deal with increment 12
cut -9181
deal with increment 63
deal into new stack
deal with increment 14
cut -2906
deal with increment 10
cut 848
deal with increment 75
cut 798
deal with increment 29
cut 1412
deal with increment 10
deal into new stack
cut -5295
deal into new stack
cut 4432
deal with increment 72
cut -7831
deal into new stack
cut 6216
deal into new stack
deal with increment 7
cut -1720
deal into new stack
cut -5465
deal with increment 70
cut -5173
deal with increment 7
cut 3874
deal with increment 65
cut 921
deal with increment 8
cut -3094

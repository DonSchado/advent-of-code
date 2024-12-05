packet = DATA.read.chomp.split('')

bits = packet.each_with_object([]) do |d, memo|
  memo << d.to_i(16).to_s(2).rjust(4, '0')
end

header = bits.join[0..6].scan(/.{3}/)

p bits: bits.join, header: header, version: header[0].to_i(2), type: header[1].to_i(2)

# type mapping ?


__END__
38006F45291200

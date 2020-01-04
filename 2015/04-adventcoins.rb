require 'digest'

secret = 'yzbqklnj'

mining = ['-', '/', '|', '\\'].cycle

(100000..).each do |n|
  md5 = Digest::MD5.hexdigest([secret, n].join)

  if md5.start_with?('000000')
    puts "#{n}: #{md5}"
    exit
  else
    print "\r#{mining.next}"
  end
end

# part 1: 5 zeros (00000)
# 282749: 000002c655df7738246e88f6c1c43eb7

# part 2: 6 zeros (000000)
# 9962624: 0000004b347bf4b398b3f62ace7cd301

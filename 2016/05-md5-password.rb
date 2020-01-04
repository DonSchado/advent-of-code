# part 1
require 'digest'

door_id = 'uqwqemis'
password = []

# (3231929..).each do |n|
#   md5 = Digest::MD5.hexdigest([door_id, n].join)

#   if md5.start_with?('00000')
#     password << md5[5]
#     break if password.size == 8
#   end
# end

# 'abc'
# => 18f47a30

# 'uqwqemis'
puts 'Given the actual Door ID, what is the password?'
puts password.join
# 1a3099aa


# part 2
puts 'Given the actual Door ID and this new method, what is the password?'
# Be extra proud of your solution if it uses a cinematic "decrypting" animation.

# 'abc'
# => 0 5 a c e 8 e 3

door_id = 'uqwqemis'
# => 6 9 4 1 9 0 c d
password = Array.new(8, '_')

require 'securerandom'
loading = SecureRandom.hex(64).split('').cycle

(3231929..).each do |n|
  md5 = Digest::MD5.hexdigest([door_id, n].join)

  if md5.start_with?('00000')
    next unless md5[5].match?(/\d/)
    index = md5[5].to_i
    next unless (0..7).cover?(index)

    password[index] = md5[6] if password[index] == '_'
  end

  print ["\r", loading.next, ': ', password.join(' '), ' '].join
  break if password.none? { |d| d == '_' }
end


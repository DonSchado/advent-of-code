
input = DATA.read.chomp.split("\n").map(&:to_i)

# part 1
puts 'Starting with a frequency of zero, what is the resulting frequency?'
puts input.sum
# => 427

# part 2
puts 'What is the first frequency your device reaches twice?'
counts = Hash.new(0)
memo = 0

loop do
  input.each do |frequency|
    memo += frequency
    counts[memo] += 1

    if counts[memo] == 2
      puts memo
      exit
    end
  end
end
# => 341


__END__
+13
-3
-8
+14
+16
-7
+3
-7
+9
-10
+16
+13
+12
+12
+4
+19
-2
-5
-15
-2
-13
-11
-13
-2
+5
-12
+17
+12
-8
+11
+2
+19
-14
+20
-5
+7
+6
+20
-12
+7
+3
-8
-3
-16
-15
+1
-16
+3
-11
+18
-14
-10
+23
+20
-16
+8
-9
+16
-11
+10
-5
+14
+8
+9
-1
-2
+12
+1
+16
-12
+7
+16
+8
+6
+8
-17
-7
+13
+18
+15
-7
-16
+12
-7
-3
-17
-3
-7
+8
-13
-4
-12
+19
+1
-12
-18
+16
-10
+19
-14
+12
+19
+18
+9
+1
+11
+2
-7
+17
-15
+7
-18
-5
+15
+18
+7
+3
+8
+2
+15
-3
+18
-17
-11
-11
+4
+11
-18
-14
+7
-12
-9
-4
-18
-6
-3
+8
-15
-9
-19
-19
+11
+19
+16
-4
+18
-16
+14
-3
+21
-7
-5
+1
-4
+12
+25
+4
+16
-14
+10
-4
+20
+9
+5
-9
-14
+1
+20
+19
+14
+12
-2
-19
-4
-3
+19
-15
+11
+14
-2
+19
+5
-3
+14
+19
-1
-6
+11
+12
+10
+16
+9
+13
+17
-3
-11
+18
-6
-18
+9
-5
-3
-13
-9
-8
-13
-8
-2
-8
+19
-17
-8
-6
-4
+13
+10
+9
-11
+8
+13
+4
+13
-6
+8
-12
+19
+15
-5
+17
+17
-6
+16
-11
-10
-20
-12
+1
+4
-2
-21
-15
+8
+16
+5
-17
-9
+4
-3
+18
+17
-12
-11
+15
-17
-13
-10
+3
-2
-8
+5
+8
+5
-16
-24
+19
-22
+12
-18
+4
-10
-17
+7
+14
+4
-5
-2
-15
-14
-9
-2
-2
-17
-18
-4
+13
+12
-1
+2
-6
+22
+6
+6
+10
+9
+5
-7
+14
+14
-12
+16
-3
+8
-2
-10
+2
+4
-11
+18
-15
-22
-10
-18
+1
-16
-11
+12
-22
+13
+11
+4
-13
-6
-21
-16
-11
-7
+11
-5
+4
+9
+10
-8
+15
-9
+12
+14
-10
+1
+22
+9
+3
+21
+14
-8
+7
+2
-20
+12
+21
-36
-4
+2
+18
-14
+10
-109
-1
+9
-69
+14
-13
+7
-4
-34
+10
-5
+15
-17
-9
+5
+14
+9
+10
-68
+22
+10
-47
-14
-3
+20
-13
+22
-8
-8
+2
-17
-15
+11
-3
-1
+15
-6
-12
-16
-14
+3
+15
-12
-4
+2
-15
+16
+15
+4
-16
+28
-21
-8
+18
+6
-18
+40
+18
+10
-20
+26
-17
-100
+2
+6
+9
-26
+62
+202
+40
-72
-58332
-10
-10
+14
+1
-20
+4
-19
+17
-19
-10
+13
+6
+6
-8
+5
-6
+4
+15
+13
-11
-4
-3
+10
+18
-4
+12
+19
+1
-2
-7
-15
-12
+14
+12
-15
+4
-21
+12
-18
+3
+12
-19
-11
-19
-15
+14
-2
-14
-13
+14
+18
+18
-16
+7
-20
+4
-2
-21
-16
-11
+19
+17
-2
-6
+4
+15
-2
+20
+4
+3
-10
-9
-12
+3
+16
-4
-7
-16
-7
-9
-12
+19
+7
-19
+10
+13
-6
+8
-21
-6
-15
+4
-2
-4
-9
+14
+10
-17
+11
-10
-5
-16
-1
-16
-6
-17
+3
-16
-15
-11
-17
-9
-8
-9
+2
+13
-8
-4
+2
+9
-1
+12
+5
+9
-7
+8
+7
+18
+16
-7
+9
+18
-17
+12
-16
-12
-5
+15
-12
-13
+9
-1
-12
-4
-3
+16
-12
-9
+4
+18
+20
-9
+18
+10
-6
-16
+11
+8
+7
+11
+4
+2
-15
-7
+17
+19
+12
-11
-10
+16
+15
-16
-3
-13
-11
-3
-18
+16
-4
-14
-17
-5
+8
+11
-15
-15
-8
-15
-11
-4
-7
-17
+3
-6
-12
-11
-7
-3
+15
-4
+2
-7
-15
+3
-2
+3
-16
+9
+11
-15
-13
+3
+6
-12
-8
+2
-20
-4
-4
-12
+5
+20
+11
-17
-13
+12
-10
-4
-18
-12
+1
-11
+13
-7
+19
-4
+12
+20
-2
+12
+3
-1
+15
+10
-17
+18
-8
-5
-8
-11
+16
-4
-2
+8
+10
-3
-3
+15
-1
+12
+12
+17
+16
+12
-15
+17
+18
-8
-19
-6
-17
-1
+8
-4
+8
-1
-4
+3
-1
-19
+8
-15
-1
+15
-20
-7
-14
+11
+21
+5
-15
-19
+20
-15
-11
-19
-3
+15
-17
-4
-15
-19
-5
+16
-17
-16
+3
+4
-5
-13
+10
+22
+5
+10
-1
-3
-5
+1
-18
-14
+1
+4
-15
+26
+6
+6
-32
-12
-12
+16
+4
-14
+4
-6
-15
-36
-34
+12
+9
-16
+9
-20
+10
+2
-8
+11
-12
-5
+19
-51
-12
+24
-22
+15
-7
-2
+11
+14
-4
-7
+17
-16
-3
-13
-9
+20
-15
-21
+10
-7
-16
-17
-8
-1
-7
+11
-17
-19
+8
-3
+11
-12
-25
-22
+16
-20
-10
-19
-42
-18
-8
+16
+2
+1
-5
+1
+22
-8
+44
-3
+21
+16
+1
+29
+17
-23
-2
-5
+17
+20
+21
+7
-14
-60
+31
+13
+60
-21
+56
+99
+10
-29
-16
+105
+5
-272
-57969
+5
-4
-13
+2
-10
-10
+19
-16
-2
-3
-5
-11
-7
+12
-9
+2
+3
-12
-10
+1
-10
-7
+12
-14
-2
+1
-5
+17
+4
-9
-21
-10
+17
-24
-12
+2
-12
+18
-1
-9
+6
+6
+20
+10
+11
-12
-2
-15
+12
-23
+3
-17
-4
-10
+22
-13
-4
+3
+8
-13
-19
-2
-5
-19
+6
-18
+4
-10
+3
+13
-5
-4
-3
-7
-2
+18
+7
+8
+3
-10
+12
-7
+12
+16
-11
+4
+15
-3
-7
+6
-13
-13
-18
-2
-14
-2
-16
+1
+8
-7
+5
-14
+19
+17
-8
+14
+19
+7
+10
+2
-5
+23
+12
+21
-10
+8
+31
+12
+117267

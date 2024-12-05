input = DATA.read.split.map(&:to_i)

charging    = 0
built_in    = input.max + 3
adapters    = (input << charging << built_in).sort
differences = Hash.new(0)

adapters.each_index.each_with_object(differences) do |i, diff|
  if adapters[i.next]
    diff[adapters[i.next] - adapters[i]] += 1
  end
end

puts '1) What is the number of 1-jolt differences multiplied by the number of 3-jolt differences?'
p differences
p differences[1] * differences[3]
# => 2343

puts '2) What is the total number of distinct ways you can arrange the adapters to connect the charging outlet to your device?'
def dynamic_traverse(adapters, i, nodes = {})
  return 1 unless adapters[i.next]
  return nodes[i] if nodes[i] # this is were the *magic* happens :)

  nodes[i] = (i.next..adapters.size).reduce(0) do |path_count, next_node|
    if adapters[next_node] && (adapters[next_node] - adapters[i]) <= 3
      # the number of paths from i to adapters[next_node] is dynamic_traverse(next_node)
      path_count += dynamic_traverse(adapters, next_node, nodes)
    end
    path_count
  end
end

# maxim
# jolt_steps = DATA.read.split("\n").map(&:to_i).sort
# jolt_steps << max_jolts = jolt_steps.last + 3 # max jolts is always +3 to latest adapter
# varieties = { 0 => 1 }
# jolt_steps.each do |jolts|
#   varieties[jolts] = varieties.sum { |key, value| jolts - key <= 3 ? value : 0 }
# end
# p varieties

p dynamic_traverse(adapters, 0)
# => 31581162962944

__END__
73
114
100
122
10
141
89
70
134
2
116
30
123
81
104
42
142
26
15
92
56
60
3
151
11
129
167
76
18
78
32
110
8
119
164
143
87
4
9
107
130
19
52
84
55
69
71
83
165
72
156
41
40
1
61
158
27
31
155
25
93
166
59
108
98
149
124
65
77
88
46
14
64
39
140
95
113
54
66
137
101
22
82
21
131
109
45
150
94
36
20
33
49
146
157
99
7
53
161
115
127
152
128

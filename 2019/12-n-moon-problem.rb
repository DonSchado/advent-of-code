
Moon = Struct.new(:name, :pos, :vel) do
  def inspect
    "(#{name}): pos=#{pos.inspect} vel=#{vel.inspect}"
  end

  def apply_velocity
    self.pos = Vec.new(
      pos.x + vel.x,
      pos.y + vel.y,
      pos.z + vel.z
    )
  end

  def total_energy
    pos.energy * vel.energy
  end
end

Vec = Struct.new(:x, :y, :z) do
  def inspect
    "[#{x},#{y},#{z}]"
  end

  def energy
    [x,y,z].map(&:abs).reduce(:+)
  end
end

# velocity of each moon starts at 0
# EXAMPLE_1
# moons = [
#   Moon.new('Io',       Vec.new(-1,  0,  2), Vec.new(0,0,0)),
#   Moon.new('Europa',   Vec.new( 2,-10, -7), Vec.new(0,0,0)),
#   Moon.new('Ganymede', Vec.new( 4, -8,  8), Vec.new(0,0,0)),
#   Moon.new('Callisto', Vec.new( 3,  5, -1), Vec.new(0,0,0)),
# ]

# Input
moons = [
  Moon.new('Io',       Vec.new(-16, -1, -12), Vec.new(0,0,0)),
  Moon.new('Europa',   Vec.new(  0, -4, -17), Vec.new(0,0,0)),
  Moon.new('Ganymede', Vec.new(-11, 11,   0), Vec.new(0,0,0)),
  Moon.new('Callisto', Vec.new(  2,  2,  -6), Vec.new(0,0,0)),
]

# Time progresses by one step once all of the positions are updated.
1.upto(1000).each do |step|
  # update the velocity of every moon by applying gravity => consider every pair of moons
  moons.combination(2).each do |a, b|
    if a.pos.x > b.pos.x
      a.vel.x -= 1
      b.vel.x += 1
    elsif a.pos.x < b.pos.x
      a.vel.x += 1
      b.vel.x -= 1
    end

    if a.pos.y > b.pos.y
      a.vel.y -= 1
      b.vel.y += 1
    elsif a.pos.y < b.pos.y
      a.vel.y += 1
      b.vel.y -= 1
    end

    if a.pos.z > b.pos.z
      a.vel.z -= 1
      b.vel.z += 1
    elsif a.pos.z < b.pos.z
      a.vel.z += 1
      b.vel.z -= 1
    end
  end

  # apply velocity: simply add the velocity of each moon to its own position
  moons.each do |moon|
    moon.apply_velocity
  end
end

puts "After 1000 steps:"
moons.each do |moon|
  puts moon.inspect
end
# (Io): pos=[-20,2,-35] vel=[20,5,4]
# (Europa): pos=[52,18,-17] vel=[-6,9,-9]
# (Ganymede): pos=[1,-11,4] vel=[-8,-9,-4]
# (Callisto): pos=[-58,-1,13] vel=[-6,-5,9]

puts
puts "PART 1: Energy after 1000 steps:"
# Sum of total energy: 36 + 45 + 80 + 18 = 179
puts moons.map { |moon| moon.total_energy } .reduce(:+)
# => 5517

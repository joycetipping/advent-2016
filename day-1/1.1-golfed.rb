cardinals = [:N, :E, :S, :W]
current = 0
x = y = 0

steps = "L2, L3, L3, L4, R1, R2, L3, R3, R3, L1, L3, R2, R3, L3, R4, R3, R3,
L1, L4, R4, L2, R5, R1, L5, R1, R3, L5, R2, L2, R2, R1, L1, L3, L3, R4, R5, R4,
L1, L189, L2, R2, L5, R5, R45, L3, R4, R77, L1, R1, R194, R2, L5, L3, L2, L1,
R5, L3, L3, L5, L5, L5, R2, L1, L2, L3, R2, R5, R4, L2, R3, R5, L2, L2, R3, L3,
L2, L1, L3, R5, R4, R3, R2, L1, R2, L5, R4, L5, L4, R4, L2, R5, L3, L2, R4, L1,
L2, R2, R3, L2, L5, R1, R1, R3, R4, R1, R2, R4, R5, L3, L5, L3, L3, R5, R4, R1,
L3, R1, L3, R3, R3, R3, L1, R3, R4, L5, L3, L1, L5, L4, R4, R1, L4, R3, R3, R5,
R4, R3, R3, L1, L2, R1, L4, L4, L3, L4, L3, L5, R2, R4,
L2".split(',').map(&:strip)

steps.each do |step|
  left_right = step[0]
  magnitude = step[1..-1].to_i

  current += left_right == 'L' ? 3 : 1
  current %= 4

  case cardinals[current]
  when :N
    y += magnitude
  when :S
    y -= magnitude
  when :E
    x += magnitude
  when :W
    x -= magnitude
  end
end

puts x.abs + y.abs

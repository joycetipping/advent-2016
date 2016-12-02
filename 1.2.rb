cardinals = [:N, :E, :S, :W]
current = :N
position = [0, 0]
visited = []

steps = "L2, L3, L3, L4, R1, R2, L3, R3, R3, L1, L3, R2, R3, L3, R4, R3, R3, L1, L4, R4, L2, R5, R1, L5, R1, R3, L5, R2, L2, R2, R1, L1, L3, L3, R4, R5, R4, L1, L189, L2, R2, L5, R5, R45, L3, R4, R77, L1, R1, R194, R2, L5, L3, L2, L1, R5, L3, L3, L5, L5, L5, R2, L1, L2, L3, R2, R5, R4, L2, R3, R5, L2, L2, R3, L3, L2, L1, L3, R5, R4, R3, R2, L1, R2, L5, R4, L5, L4, R4, L2, R5, L3, L2, R4, L1, L2, R2, R3, L2, L5, R1, R1, R3, R4, R1, R2, R4, R5, L3, L5, L3, L3, R5, R4, R1, L3, R1, L3, R3, R3, R3, L1, R3, R4, L5, L3, L1, L5, L4, R4, R1, L4, R3, R3, R5, R4, R3, R3, L1, L2, R1, L4, L4, L3, L4, L3, L5, R2, R4, L2".split(',').map(&:strip)

steps.each do |step|
  left_right = step[0]
  magnitude = step[1..-1].to_i

  if left_right == 'L'
    current = cardinals[cardinals.index(current) - 1]
  else
    current = cardinals[(cardinals.index(current) + 1) % 4]
  end

  if current == :N
    position[1] += magnitude
  elsif current == :S
    position[1] -= magnitude
  elsif current == :E
    position[0] += magnitude
  elsif current == :W
    position[0] -= magnitude
  end

  if visited.index(position)
    break
  else
    visited << position.dup
  end
end

blocks = position[0].abs + position[1].abs
puts blocks

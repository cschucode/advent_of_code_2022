stacks_and_rules = File.read('sample_input').split("\n\n")

# puts stacks_and_rules

stacks = stacks_and_rules[0].split("\n")

puts stacks

piles = []

for stack in stacks do
  idx = 0
  stack.each_char { |letter|
    if letter == '['
      if piles[idx + 1].nil?
        piles[idx + 1] = [stack[idx + 1]]
      else
        piles[idx + 1] = piles[idx + 1].unshift(stack[idx + 1])
      end
    end
    idx += 1
  }
end

piles = piles.compact

puts piles.to_s

rule_items = stacks_and_rules[1].split("\n")

for rule in rule_items do
  items = rule.split(" ")
  stack_from = items[3].to_i
  num_of_crates = items[1].to_i
  stack_to = items[5].to_i

  boxes_to_move = piles[stack_from - 1][-num_of_crates, num_of_crates]

  start = 0

  while start < num_of_crates do
    piles[stack_from - 1].pop()
    start += 1
  end

  piles[stack_to - 1] = piles[stack_to - 1] + boxes_to_move
end

solution = ''

for row in piles do
  solution += row.pop()
end 

puts "The solutions is #{solution}"

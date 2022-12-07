input = File.read("input").split("\n")

# puts input, input.length

# priority key
key = ' abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
running_total = 0
groups = 0
letters = []

# Need to split the input into two halves
# for sack in input do
#   len = sack.length
#   first_half_start = 0
#   first_half_end = (len / 2)
#   second_half_start = len / 2
#   second_half_end = len - 1
  
#   first_half = sack[first_half_start, first_half_end]
#   second_half = sack[second_half_start, second_half_end]

#   for letter in first_half.split('') do
#     unless second_half.index(letter).nil?
#       running_total += key.index(letter)
#       letters << letter
#       break
#     end
#   end
# end

start_idx = 0
end_idx = 2

while end_idx <= input.length do
  group_of_three = input[start_idx..end_idx]

  elf_one = group_of_three.first
  elf_two = group_of_three[1]
  elf_three = group_of_three.last

  puts elf_one
  puts elf_two
  puts elf_three
  puts 'break'

  groups += 1
  
  for letter in elf_one.split('') do
    if !elf_two.index(letter).nil?
      if !elf_three.index(letter).nil?
        running_total += key.index(letter)
        letters << "#{letter}:#{key.index(letter)}"
        break
      end
    end
  end

  start_idx = end_idx + 1
  end_idx += 3
end

puts letters.to_s, groups, running_total

# for letter in 'dog'.split('') do
#   puts letter
# end

# puts !'dog'.index('o').nil?
# puts !'dog'.index('a').nil?

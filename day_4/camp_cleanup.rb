pairs = File.read('input').split("\n")

count = 0

def check_for_contains(e1s, e1e, e2s, e2e)
  if (e2s >= e1s && e2s <= e1e)
    return true
  elsif (e1s >= e2s && e1s <= e2e)
    return true
  elsif (e2e >= e1s && e2e <= e1e)
    return true
  elsif (e1e >= e2s && e1e <= e2e)
    return true
  end
  false
end

for pair in pairs do
  elves = pair.split(',')

  elf_one_section = elves.first.split('-')
  elf_two_section = elves.last.split('-')

  elf_one_start = elf_one_section[0].to_i
  elf_one_end = elf_one_section[1].to_i

  elf_two_start = elf_two_section[0].to_i
  elf_two_end = elf_two_section[1].to_i

  # comparison function goes here
  if check_for_contains(elf_one_start, elf_one_end, elf_two_start, elf_two_end)
    count += 1
  end
end

puts count

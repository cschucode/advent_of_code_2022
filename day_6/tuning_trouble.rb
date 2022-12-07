input = File.read("input")

def find_unique_sequence(input, length)
  sequence = []
  
  input.each_char.with_index do |char, idx|
    new_idx = idx += 1
  
    if sequence.length < length
      sequence.push(char)
    else
      sequence.shift()
  
      if sequence.index(char).nil?
        sequence.push(char)
  
        unless sequence.uniq.length < 4
          return "sequence: #{sequence.join()} at index: #{new_idx}"
        end
      else
        sequence.push(char)
      end
    end
  end
end

puts find_unique_sequence(input, 4)

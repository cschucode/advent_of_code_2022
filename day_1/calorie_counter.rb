lines = File.read("input").split("\n")

def calorie_counter(lines, one_elf)
    top_elf = 0
    second_elf = 0
    third_elf = 0

    running_total = 0

    for line in lines do
        if !line.empty?
            running_total += line.to_i
        else
            if running_total > top_elf
                temp1 = top_elf
                temp2 = second_elf

                top_elf = running_total
                second_elf = temp1
                third_elf = temp2
            elsif running_total > second_elf
                temp = second_elf

                second_elf = running_total
                third_elf = temp
            elsif running_total > third_elf
                third_elf = running_total
            end
            running_total = 0
        end
    end
    one_elf ? top_elf : (top_elf + second_elf + third_elf)
end

# Part 1 (top elf)
puts calorie_counter(lines, true)

# Part 2 (top 3)
puts calorie_counter(lines, false)

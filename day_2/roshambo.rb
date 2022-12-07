throws = File.read("input").split("\n")

class Turn
  def initialize(opp_throw, my_throw)
    if (my_throw == 'X')
      @outcome = 0
      if (opp_throw == 'A')
        @val = 3
      elsif (opp_throw == 'B')
        @val = 1
      elsif (opp_throw == 'C')
        @val = 2
      end
    elsif (my_throw == 'Y')
      @outcome = 3
      if (opp_throw == 'A')
        @val = 1
      elsif (opp_throw == 'B')
        @val = 2
      elsif (opp_throw == 'C')
        @val = 3
      end
    elsif (my_throw == 'Z')
      @outcome = 6
      if (opp_throw == 'A')
        @val = 2
      elsif (opp_throw == 'B')
        @val = 3
      elsif (opp_throw == 'C')
        @val = 1
      end
    end
  end

  def get_outcome
    @val + @outcome
  end
end

# turn = Turn.new('A', 'Y') 

# puts turn.get_outcome()
running_total = 0

for throw in throws do
  turns = throw.split(' ')
  opp = turns[0]
  me = turns[1]

  turn = Turn.new(opp, me)
  running_total += turn.get_outcome()
end

puts running_total

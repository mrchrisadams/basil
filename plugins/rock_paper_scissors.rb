module Basil
  Choices = [:rock, :paper, :scissors]

  class RockPaperScissors
    def initialize(player_a, player_b)
      @a, @b = player_a, player_b
    end

    def throw_em!(out)
      @a_threw = Choices.shuffle.first
      @b_threw = Choices.shuffle.first

      out << "#{@a} threw #{@a_threw}"
      out << "#{@b} threw #{@b_threw}"

      if winner = get_winner
        out << "#{winner} wins!"
      else
        out << "tie."
        throw_em!(out)
      end
    end

    def get_winner
      case [@a_threw,@b_threw]
      # rock breaks scissors
      when [:rock,:scissors] then @a
      when [:scissors,:rock] then @b

      # scissors cut paper
      when [:scissors,:paper] then @a
      when [:paper,:scissors] then @b

      # paper covers rock
      when [:paper,:rock] then @a
      when [:rock,:paper] then @b

      else nil # tie
      end
    end
  end
end

Basil::Plugin.respond_to(/^(rps|rock ?paper ?scissors) (\w+) (\w+)$/) {

  says do |out|
    Basil::RockPaperScissors.new(@match_data[2], @match_data[3]).throw_em!(out)
  end

}.description = "plays out a fake game of rock paper scissors"

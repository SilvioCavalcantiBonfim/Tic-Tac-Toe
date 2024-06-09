class HumanController

    attr_writer :player_name

    def initialize(validate)
      @validate = validate
    end

  def read
    print "\nRodada do jogador #{@player_name}: "
    move = nil
    loop do
        raw_input = gets.chomp
        if raw_input.match?(/^\d$/) && @validate.call(raw_input.to_i)
          move = raw_input.to_i
          break 
        end
        print "Jogada \e[1;31minválida\e[0m! Tente novamente: "
    end
    move
  end
end

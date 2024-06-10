require "./controller/AI/AbstractAIController"

class IASecondController < AbstractAIController
  def read
    print "\nRodada do jogador #{@player_name}. Aguarde..."
    value = Float::INFINITY
    move = nil
    @board.actions.each do |action|
      max_value_result = max_value(clone_board_and_play_action(@board, action))
      if max_value_result < value
        value = max_value_result
        move = action
      end
    end
    move
  end
end

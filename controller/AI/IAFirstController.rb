require "./controller/AI/AbstractAIController"

class IAFirstController < AbstractAIController
  def read
    print "\nRodada do jogador #{@player_name}. Aguarde..."
    value = -Float::INFINITY
    move = nil
    @board.actions.each do |action|
      min_value_result = min_value(clone_board_and_play_action(@board, action))
      if min_value_result > value
        value = min_value_result
        move = action
      end
    end
    move
  end
end

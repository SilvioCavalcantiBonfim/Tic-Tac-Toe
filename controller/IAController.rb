class IAController

    attr_writer :player_name

    def initialize(board)
        @board = board
    end

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

    private
    def clone_board_and_play_action(current_board, action)
      new_board = current_board.copy
      new_board.play(action)
      new_board
    end

    def max_value(current_board)
      if current_board.terminal?
        return current_board.whats_winner
      end

      v = -Float::INFINITY
       current_board.actions.each do |action|
        v = [v, min_value(clone_board_and_play_action(current_board, action))].max
       end
      v
    end

    def min_value(current_board)
        if current_board.terminal?
            return current_board.whats_winner
          end
    
          v = Float::INFINITY
           current_board.actions.each do |action|
            v = [v, min_value(clone_board_and_play_action(current_board, action))].min
           end
          v
    end
end

class AbstractAIController
  attr_writer :player_name

  def initialize(board)
    @board = board
  end

  def read
    raise NotImplementedError, "Method not implemented."
  end

  protected

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
      v = [v, max_value(clone_board_and_play_action(current_board, action))].min
    end
    v
  end
end

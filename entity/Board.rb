class Board
  WEIGHTS = [2, 3, 5, 7, 11, 13, 17, 19, 23]

  WINNER_TABLE = [30, 238, 506, 627, 935, 1001, 1495, 7429]

  def initialize(state = Array.new(9), score = [1, 1])
    @state = state
    @score = score
  end

  def copy
    Marshal.load(Marshal.dump(self))
  end

  def actions
    @state.map.with_index { |element, index| index if element.nil? }.compact
  end

  def valid_play?(position)
    actions.include?(position)
  end

  def whats_winner
    if winner?(0)
      return 1
    elsif winner?(1)
      return -1
    else
      return 0
    end
  end

  def terminal?
    (@state.count(nil) == 0) || winner?(0) || winner?(1)
  end

  def play(position)
    raise ArgumentError, "Invalid movement" unless valid_play?(position)

    player_id = current_player()
    @state[position] = player_id
    @score[player_id] *= WEIGHTS[position]
  end

  def render(players)
    data_render = Array.new(3) { Array.new(3) }

    (0..8).each do |index|
      data_render[index / 3][(index % 3).to_i] = " #{render_player(players, index)} "
    end

    line_render = data_render.map do |sub|
      "".center(22).concat(sub.join("|"))
    end

    puts line_render.join("\n#{"---+---+---".rjust(33)}\n")
  end

  private

  def current_player
    (@state.count(1) == @state.count(0)) ? 0 : 1
  end

  def winner?(player)
    WINNER_TABLE.any? { |element| @score[player] % element == 0 }
  end

  def render_player(players, index)
    case @state[index]
    when 0
      players[0].render_symbol
    when 1
      players[1].render_symbol
    else
      Color.colorize("#{index}", Color::GRAY)
    end
  end
end

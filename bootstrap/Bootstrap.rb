require "./entity/Board"
require "./entity/Player"
require "./util/Color"
require "./view/View"

class Bootstrap
  def self.exec(board, controllerA, controllerB)
    turn = 0
    view = View.new

    playerA = Player.new("Player A", Color::GREEN, "☓︎", controllerA)
    playerB = Player.new("Player B", Color::BLUE, "◯", controllerB)

    players = [playerA, playerB]

    loop do
      view.render_title

      current_player = players[turn % 2]

      board.render(players)
      board.play(current_player.controller.read)

      turn += 1
      break if board.terminal?
    end

    view.render_title
    board.render(players)

    player_winner = nil
    case board.whats_winner
    when 1
      player_winner = playerA
    when -1
      player_winner = playerB
    else
    end

    view.render_winner(player_winner)
  end
end

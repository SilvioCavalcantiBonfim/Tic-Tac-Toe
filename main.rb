require './entity/Board'
require './entity/Player'
require './controller/HumanController'
require './controller/IAController'
require './util/Color'
require './view/View'

turn = 0

view = View.new

board = Board.new

iacontroller = IAController.new(board)

controller = HumanController.new(-> (value) {board.valid_play?(value)})

player1 = Player.new("Você", Color::GREEN, "☓︎", controller)
player2 = Player.new("IA", Color::BLUE, "◯", iacontroller)

players = [player1, player2]


loop do

    view.render_title

    current_player = players[turn%2]

    board.render(players)
    board.play(current_player.controller.read)
    
    turn+=1
    break if board.terminal?

end

view.render_title
board.render(players)
if board.player1_winner?
  puts "\nVitória do jogador #{player1.render_name}!"  
elsif board.player2_winner?
    puts "\nVitória do jogador #{player2.render_name}!"  
else
    puts "\nO jogo terminou em #{Color.colorize("empate", Color::YELLOW)}!"  
end
require "./controller/HumanController"
require "./controller/AI/IASecondController"
require "./bootstrap/Bootstrap"

class PVEBootstrap
  def self.run()
    board = Board.new
    controllerA = HumanController.new(->(value) { board.valid_play?(value) })
    controllerB = IASecondController.new(board)
    Bootstrap.exec(board, controllerA, controllerB)
  end
end

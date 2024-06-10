require "./controller/HumanController"
require "./bootstrap/Bootstrap"

class PVPBootstrap
  def self.run()
    board = Board.new
    controllerA = HumanController.new(->(value) { board.valid_play?(value) })
    controllerB = HumanController.new(->(value) { board.valid_play?(value) })
    Bootstrap.exec(board, controllerA, controllerB)
  end
end

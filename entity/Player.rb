require './util/Color'

class Player
  attr_reader :controller
  def initialize(name, color, symbol, controller)
    @name = name
    @color = color
    @symbol = symbol
    @controller = controller
    setting_controller
  end

  def render_name
    Color.colorize(@name, @color)
  end

  def render_symbol
    Color.colorize(@symbol, @color)
  end

  private
  def setting_controller
    @controller.player_name = Color.colorize(@name, @color)
  end
end

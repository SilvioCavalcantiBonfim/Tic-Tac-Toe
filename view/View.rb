require "./util/Color"

class View
  TITLE = "  _______          ______               ______         
 /_  __(_)____    /_  __/___ ______    /_  __/___  ___
  / / / / ___/_____/ / / __ `/ ___/_____/ / / __ \\/ _ \\
 / / / / /__/_____/ / / /_/ / /__/_____/ / / /_/ /  __/
/_/ /_/\\___/     /_/  \\__,_/\\___/     /_/  \\____/\\___/"
  AUTHOR = "By Silvio Cavalcanti\n"

  def render_title
    system "clear"
    puts Color.colorize_rainbow(TITLE)
    puts Color.colorize(AUTHOR.rjust(54), Color::GRAY)
  end

  def render_winner(winner)
    if winner.nil?
      puts "\nO jogo terminou em #{Color.colorize("empate", Color::YELLOW)}!"
    else
      puts "\nVitória do jogador #{winner.render_name}!"
    end
  end
end

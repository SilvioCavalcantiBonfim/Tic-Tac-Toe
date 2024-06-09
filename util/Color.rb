module Color
    GREEN = "\e[1;32m"
    BLUE = "\e[1;34m"
    RED = "\e[1;31m"  
    YELLOW = "\e[1;33m"
    CYAN = "\e[1;36m"
    MAGENTA = "\e[1;35m"
    BLACK = "\e[1;30m"
    WHITE = "\e[1;37m"
    GRAY = "\e[2;37m"
  
    RESET = "\e[0m"
  
    def self.colorize(text, color_code)
      "#{color_code}#{text}#{RESET}"
    end

    def self.colorize_rainbow(text)
        color_rainbow = [RED, YELLOW, GREEN, CYAN, BLUE, MAGENTA]
        text.chars.map.with_index do |char , index|
            colorize(char, color_rainbow[index%color_rainbow.count])
        end.join("")
      end
  end  
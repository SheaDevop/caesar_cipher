module MasterMind
  COLORS = ["yellow", "green", "blue", "violet", "red", "orange"]

  class Game
    def initialize(player_1_class, player_2_class)
      @code_maker = player_1_class
      @code_breaker = player_2_class
    end
    attr_reader :code_breaker, :code_maker

    def play
      @code_maker.selects_code
      @atempts = 10
      while (@atempts >= 0) do
        @code_breaker.try_to_guess
        if player_has_won?
          puts "Congrats #{@code_breaker} has won, awesome!!"
        else
          give_feedback
          @atempts -= 1
        end
      end
      puts "So sad u didn't guess correctly, looser!"
    end

    def give_feedback
      @black_pins = 0    #number of correct colors in correct place
      @white_pins = 0    #just correct color in wrong place
      @code_maker.code.each_index do |index|
        if @code_maker.code[index] == @code_breaker.code[index]
          @black_pins += 1
        elsif @code_maker.code.any? {|color| color == @code_breaker.code[index]}
          @white_pins += 1 
        end
      end
      puts "the code make puts #{black_pins} black pins and #{white_pins} white pins on the board"
    end

    def player_has_won?
      if @black_pins == 4
      end
    end
  end

  class Player
    def initialize
    end
    attr_reader :code
  end

  class Human < Player
    def selects_code
      puts "Select a 4 color combination code from #{COLORS} options"
      4.times do 
        @code.push(gets.chomp)
      end
    end

    def try_to_guess
      puts "try to guess the 4 colors code, possible colors are: #{COLORS}"
      4.times do 
        @code.push(gets.chomp)
      end
    end
  end

  class Computer < Player
    def selects_code
      4.times do
        @code.push(COLORS.sample)
      end
    end

    def try_to_guess





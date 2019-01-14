class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    until game_over
      take_turn
    end 
    game_over_message
    sleep(3)
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    puts "Sequence beginning!"
    sleep(1)
    add_random_color
    seq.each do |str|
      puts str 
      sleep(1)
      system("clear")
    end 
  end

  def require_sequence
    puts "Enter each color, separated by a new line"
    seq.each do |color|
      user_guess = gets.chomp.downcase
      if user_guess != color 
        game_over = true
      end 
    end 
    system("clear")
  end

  def add_random_color
    next_color = COLORS.sample 
    seq << next_color 
  end

  def round_success_message
    puts "Congrats! Onto the next round"
  end

  def game_over_message
    puts "Sorry, game over! Sequence length was #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []
    # play
  end
end

if __FILE__ == $PROGRAM_NAME 
  system("clear")
  game = Simon.new
  game.play 
end

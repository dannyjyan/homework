class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1 
    @name2 = name2 
    @cups = Array.new(14) {Array.new}
    place_stones 
  end

  def place_stones
    cups.each_with_index do |cup, idx| 
      next if idx == 6 || idx == 13 
      @cups[idx] = [:stone,:stone,:stone,:stone]
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise RangeError.new("Invalid starting cup") if start_pos > 12 || start_pos < 0
    raise ArgumentError.new("Starting cup is empty") if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_index = start_pos
    until stones.empty?
      cup_index += 1
      cup_index = 0 if cup_index > 13
      
      if cup_index == 13 
        @cups[13] << stones.pop if current_player_name == @name2
      elsif cup_index == 6 
        @cups[6] << stones.pop if current_player_name == @name1
      else
        @cups[cup_index] << stones.pop 
      end 
    end 


    render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      :prompt 
    elsif @cups[ending_cup_idx].count == 1
      :switch 
    else 
      ending_cup_idx
    end
      
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? {|cup| cup.empty?} || 
    @cups[7..-1].all? {|cup| cup.empty?}
  end

  def winner
    player1_score = @cups[6].count 
    player2_score = @cups[13].count 
    if player1_score > player2_score 
      puts "Wow! #{@name1} is the winner!"
      @name1
    elsif player2_score > player1_score 
      puts "Amazing! #{@name2} is victorious!!"
      @name2
    else 
      puts "WOAH, it's a DRAW"
      :draw
    end 
  end
end

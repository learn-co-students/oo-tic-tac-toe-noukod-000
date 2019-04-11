class TicTacToe
    def initialize(board = nil)
     @board = board || Array.new(9, " ")
    end
   # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    
    
    [0,3,6],
    [1,4,7],
    [2,5,8],
    
    [0,4,8],
    [2,4,6]
    ]
  
# Define your display_board here
def display_board
  print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  print "-----------"
  print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  print "-----------"
  print " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
end

# Define your input_to_index here
def input_to_index(user_input)
   user_input.to_i - 1
end


# Define your move here
def move(index, value="X")
 @board[index] = value
end

# Define your position_taken? here
def position_taken?(index)
  @board[index]=="X" || @board[index] == "O"
end



# Define your valid_move? here
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

# Define your turn here
def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  user_input = input_to_index(user_input)
  if valid_move?(user_input)
    move(user_input, current_player)
  else 
   turn
  end
  display_board
end

# Define your turn_count here
def turn_count
  counter = 0
  @board.each do|position|
    if position == "X" || position == "O"
      counter += 1 
    end
  end
      return counter
end

# Define your current_player here
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
# Define your won? here
def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] &&
    @board[win_combination[1]] == @board[win_combination[2]] &&
    position_taken?(win_combination[0])
  end
end

#code the full? method here
def full?
  #return true if every element in the board contains something
  if @board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end


#code the draw? method here
def draw?
  !won? && full?
end

#code the over? method here
def over?
   draw? || won? || full?
end

#code the winner method here
def winner
  #return token x or o that won the game
  won = " "
  if winner = won?
    won = @board[winner.first]
  end
end
  
#code the play method here
def play
  while over? == false
    turn
  end
  if winner == "X"
    puts "Congratulations #{winner}!"
  elsif winner == "O"
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end

    

end
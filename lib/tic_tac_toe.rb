# Define your WIN_COMBINATIONS constant

class TicTacToe

  board = Array.new(9, " ")
def initialize(board = nil)
@board = board || Array.new(9, " ")
end

#def current_player
#turn_count % 2 == 0 ? "X" : "O"
#end

#def turn_count
#end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [6,4,2]
  ]

# Define your display_board here
def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


# Define your input_to_index here
def input_to_index(user_input)
  user_input.to_i - 1
end

# Define your current_player here
def move(board, index, current_player)
  @board[index] = current_player
end

# Define your position_taken? here
def position_taken?(index)
    ((@board[index] == "X") || (@board[index] == "O"))
  end

# Define your valid_move? here
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# Define your turn here
def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
end

def move(position, char)
   @board[position] = char
 end

#


def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


#turn_count
  def turn_count
    counter = 0
    @board.each do |space|
    if space == "X" || space == "O"
        counter += 1
    end
  end
  return counter
end



# Define your current_player here
def current_player
    if turn_count % 2 == 0
    "X"
    else
    "O"
  end
end

# Define your won? here
def won?
  WIN_COMBINATIONS.detect do |element|
    if (@board[element [0]]) == "X" && (@board[element[1]]) == "X" && (@board[element [2]]) == "X"
      return element
    elsif (@board[element[0]]) == "O" && (@board[element [1]]) == "O" && (@board[element[2]]) == "O"
      return element
    end
      false
  end
end


#code the draw? method here
#full?
def full?
  @board.all?{|occupied| occupied != " "}
end

#draw
def draw?
  !(won?) && (full?)
end

#code the over? method here
def over?
  if ( won? || draw? || full?)
    return true
  else
    return false
  end
end

#code the winner method here
def winner
  WIN_COMBINATIONS.detect do |element|
    if (@board[element [0]]) == "X" && (@board[element[1]]) == "X" && (@board[element[2]]) == "X"
      return "X"
    elsif (@board[element[0]]) == "O" && (@board[element[1]]) == "O" && (@board[element[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end


#code the play method here
def play
  while over? == false
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
end

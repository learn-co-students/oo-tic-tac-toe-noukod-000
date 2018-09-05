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
[6,4,2]
]


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move( index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

def turn
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  char = current_player
    if valid_move?(index) == true
      move(index, char)
      display_board
    else
      turn
    end
end

def turn_count
  count = 0
  @board.each do |play|
    if play == "X" || play == "O"
      count += 1
    end
  end
  return count
end

def current_player
  count = turn_count
  if count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
WIN_COMBINATIONS.each {|win_combination|

# win_combination is a 3 element array of indexes that compose a win, [0,1,2]

# grab each index from the win_combination that composes a win.

win_index_1 = win_combination[0]
win_index_2 = win_combination[1]
win_index_3 = win_combination[2]
position_1 = @board[win_index_1] # load the value of the board at win_index_1
position_2 = @board[win_index_2] # load the value of the board at win_index_2
position_3 = @board[win_index_3] # load the value of the board at win_index_3
if position_1 == "X" && position_2 == "X" && position_3 == "X"
  return win_combination # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
}
  return
    false
end

def full?
  @board.all?{|index| index== "X" || index == "O"}
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? || full? || draw?
    return true
  else
    return false
  end
end

def winner
  # index=won?
  # if(index==false)
  #   return nil
  # end
  # if @board[index[0]]=="X"
  #     index[0]
  #     return "X"
  # elsif @board[index[0]]=="O"
  #   return "O"
  # end
  x_arrays = @board.select do |cell|
    cell == 'X'
  end

  o_arrays = @board.select do |cell|
    cell == 'O'
  end

  if x_arrays.size > o_arrays.size
    return 'X'
  elsif o_arrays.size > x_arrays.size
    return 'O'
  else
    return nil
  end
end

def play
  play = 0
  input = gets
  until over?
    turn
  end
  if won?
    winner == "X" || winner == "O"
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end
end

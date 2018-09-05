class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

    # Define your WIN_COMBINATIONS constant
   WIN_COMBINATIONS = [
     [0,1,2], # Top row
     [3,4,5],  # Middle row
     [6,7,8], # Bottom row
     [0,3,6],  # Middle row
     [1,4,7], # Top row
     [2,5,8],  # Middle row
     [0,4,8], # Top row
     [2,4,6]  # Middle row
     # ETC, an array for each win combination
   ]

   # Helper Method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
  WIN_COMBINATIONS.detect{|case_set| case_set.all?{|case_i| position_taken?(case_i) && @board[case_i] == "X"} || case_set.all?{|case_i| position_taken?(case_i) && @board[case_i] == "O"}}
end

def full?
  @board.all?{|case_i| case_i != " "}
end

def draw?
  full? && !WIN_COMBINATIONS.include?(won?)
end

def over?
  won? || draw?
end

def winner
  winner_i = over? ? @board[won?[0]] : nil
end



def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player="X")
  @board[index] = current_player
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

# Define your play method below
def play
  until over?
    turn
  end

  if draw?
    puts "Cat's Game!"
  elsif WIN_COMBINATIONS.include?(won?)
    puts "Congratulations #{winner}!"
  end
end


def tab_line(l_num)
    line = " "
	count = 0
	3.times{ line  += "#{@board[ l_num*3 + count ]}"
	         if count < 2
			          line += " | "
			     else
			          line += " "
			     end
	         count += 1 }
	return line
end


def display_board
  sLine = ""
  count_l = 0

  3.times{
  	puts tab_line(count_l)
  	if count_l < 2
  		puts "-----------"
  	end
    count_l += 1
  }

end

end

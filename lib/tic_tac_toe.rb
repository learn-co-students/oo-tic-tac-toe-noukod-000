class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end 
  
  
# all 8 possible WIN_COMBINATIONS
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
          
          
  #method to display the board
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 
end  

 #set user input into array index       
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end  
  
  #put user input on the board
def move(index, value)
    @board[index] = value
  end 
  
  #method to verify if a position is free or taken
def position_taken?(index) 
  if @board[index] == "X" || @board[index] == "O"
    true
  elsif @board[index] == " "
    false
  elsif @board[index] == ""
    false
  elsif @board [index] == nil 
    false
  end   
end

  #method to verify the user input is valid
def valid_move?(index)
   if position_taken?(index) == false && index.between?(0,8)
     true
   end 
 end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  
 #make the action after verifying 
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
    display_board
  else
    turn
  end
end


 #verify whether the game is won 
    def  won?
       
       WIN_COMBINATIONS.each {|i|
          #get win combinations at each loops
        win_1= i[0]
        win_2 = i[1]
        win_3 = i[2]
          
          
        pos_1 = @board[win_1]
        pos_2 = @board[win_2]
        pos_3 = @board[win_3]
        
        if(pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
          return i
        elsif (pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
          return i
        end
         }
         return false
   end 
    
    #verify if board is full
    def full?
     !(@board.include?(" "))
    end
    
    
    #verify draw
    def draw?
      if !won? && full?
        return true
      else 
        return false
      end
    end
    
          #verify is the game is over
    def over?
      
      if draw? || won?  || full? 
        return true
      else
        return false
      end
      
    end
    
    
    #get who's the winner
    def winner
      save = won?
      if save == false
        return nil
      end
      if @board[save[0]] == "X"
        return "X"
      elsif @board[save[0]] == "O"
        return "O"
      end
    end
    
        # main method
def play
  while !over?
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else  puts "Cat's Game!"
end
end
end 
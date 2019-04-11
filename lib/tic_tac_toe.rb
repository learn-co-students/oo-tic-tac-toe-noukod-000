class TicTacToe

    def initialize
      @board = Array.new(9," ")
    end

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

    def display_board()
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
      @index = user_input.to_i - 1
end

def move(index, charac = "X")
  @board[index] = charac
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |pos|
    if pos == "X" || pos == "O"
      counter +=1
    end
  end
  return counter
end

def current_player()
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  winner = nil
  WIN_COMBINATIONS.each do |val|
    if val.all? {|idx| @board[idx] == "X"}
      winner = val
    elsif val.all? {|idx| @board[idx] == "O"}
      winner = val
    else
      false
    end
  end
  if winner != nil
    winner
  else
    false
  end
end

def full?
  @board.all? {|token| token == "X" || token == "O"}
end

def draw?
  if full?
    if !won?
      true
    else
      false
    end
  else
    false
  end
end

def over?
  if draw? || full? || won?
    true
  else
    false
  end
end

def winner
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|idx| @board[idx] == "X"}
      winner = "X"
    elsif combo.all? {|idx| @board[idx] == "O"}
      winner = "O"
    else
    end
  end
  winner
end
# winner(@board)

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end

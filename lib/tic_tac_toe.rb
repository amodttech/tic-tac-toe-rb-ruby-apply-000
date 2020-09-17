#Build and use helper methods within the Tic Tac Toe application
#Write a method that is responsible for the game loop in Tic Tac Toe
#Code the main executable file that will run the game in the CLI


#rspec spec/01_tic_tac_toe_spec.rb


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
  
def input_to_index(input)
    input.to_i - 1
end
  
def move(board, index, player_token)
    board[index] = player_token
end

def position_taken?(board, index)
    move = nil
    if (board[index] == " " || board[index] == "" || board[index] == nil)
      move = false
    else
      move = true
    end
end

def valid_move?(board, index)
    index.between?(0,8) != position_taken?(board, index)
end
  
def position_taken?(board, index)
    taken = nil
    if (board[index] == " " || board[index] == "" || board[index] == nil)
      taken = false
    else
      taken = true
    end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(board, index) == true
      move(board, index, current_player = "X")
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
    counter = 0
    board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter
end

def current_player(board)
    if turn_count(board) % 2 == 0 
      "X"
    else
      "O"
    end
end

def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] && 
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
    end
end

def full?(board)
    board.all?{|space| space != " "}
end
  
  
def draw?(board)
    full?(board) && !won?(board)
end
  
def over?(board)
    won?(board) || draw?(board) || full?(board)
end
  
def winner(board)
    if win_array = won?(board)
    board[win_array.first]
    end
end

def play(board)
  while over?(board) != true do
  turn(board)
end
  if won?(board)
    puts "Congratulations #{winner(board)}, you've won!"
  else
    puts "Game is a draw"
  end
end
















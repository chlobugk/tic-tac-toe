require_relative 'board.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'user.rb'

class ConsoleGame

	attr_accessor :p1, :p2, :board, :active_player, :position, :player1input, :player2input

	def initialize()
		@p1 = choose_p1
		@p2 = choose_p2
		@board = Board.new
		@active_player = p1
		
	end

	def intro 
		puts 'Welcome to Tic-Tac-Toe'
	end

	def create_board

		puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
		puts "-----------"
	    puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	    puts "-----------"
	    puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	    puts "                "
	    puts " It's #{active_player.marker}'s turn."
	    puts "                "
	end

	def fill_move
		@position = active_player.fill_move(board.ttt_board)
	end

	def update_position
		marker = active_player.marker
		if board.open_position?(@position)
			board.update_position(@position, marker)
		else
			puts "Invalid, please pick again."
			fill_move
		end
	end

	def change_player
		if active_player == p1
			@active_player = p2
		else 
			@active_player = p1
		end
	end

	def check_winner
		if board.winner?(p1.marker)
			true
		elsif board.winner?(p2.marker)
			true
		elsif
			false
		end
	end

	def check_tie
		if board.full_board?
			true
		else
			false
		end
	end

	def choose_p1
	puts "Select player X by entering 1-3. Human = 1; Random_Computer = 2; Sequential_Computer = 3"
	@player1input = gets.chomp.to_i

		if player1input == 1
			@p1 = User.new('X')
		elsif player1input == 2
			@p1 = Random_AI.new('X')
		elsif player1input == 3
			@p1 = Sequential_AI.new('X')
		else
			puts "Oops, please pick 1, 2, or 3."
			choose_p1		
		end
	end

	def choose_p2
		puts "Select player O by entering 1-3. Human = 1; Random_Computer = 2; Sequential_Computer = 3"
		@player2input = gets.chomp.to_i

		if player2input == 1
			@p2 = User.new('O')
		elsif player2input == 2
			@p2 = Random_AI.new('O')
		elsif player2input ==3
			@p2 = Sequential_AI.new('O')
		else
			puts "Oops, please pick 1, 2, or 3."
			choose_p2		
		end
	end



end











		
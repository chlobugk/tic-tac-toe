require_relative 'board.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'
require_relative 'user.rb'

class ConsoleGame

	attr_accessor :p1, :p2, :board, :active_player, :position

	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
		@board = Board.new
		@active_player = p1
		
	end

	def intro 
		puts 'Welcome to Tic-Tac-Toe'
	end

	def create_board
		puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
		puts "--------"
	    puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	    puts "--------"
	    puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	    puts "                "
	end

	def fill_move
		@position = active_player.fill_move(board.ttt_board)
	end

	def update_position
		position = fill_move
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


end











		
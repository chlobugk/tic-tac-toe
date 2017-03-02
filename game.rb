require_relative 'board.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'

class ConsoleGame

	attr_accessor :board, :p1, :p2, :active_player

	def initialize(p1, p2)
		@board = Board.new
		@p1 = p1
		@p2 = p2
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
	end

	def fill_move
		active_player.fill_move(board.ttt_board)
	end

	def update_position
		position = fill_move
		marker = active_player.marker
		board.update_position(position, marker)
	end

	def change_player
		if active_player == p1
			@active_player = p2
		else 
			@active_player = p1
		end
	end

	# def check_winner
	# 	if board.winner?(active_player.marker)
	# 		true
	# 	else
	# 		false
	# 	end
	# end

	# def check_tie
	# 	if board.full_board?
	# 		true
	# 	else
	# 		false
	# 	end
	# end


end











		
require 'sinatra'
require_relative 'board'
require_relative 'sequential'
require_relative 'random'
require_relative 'unbeatable'

board = Board.new

def fill_move
		active_player.fill_move(board.ttt_board)
	end

# def update_position
# 		position = fill_move
# 		marker = active_player.marker
# 		if board.open_position?(position)
# 			board.update_position(position, marker)
# 		else
# 			puts "Invalid, please pick again."
# 			update_position
# 		end
# 	end

# 	def change_player
# 		if active_player == p1
# 			@active_player = p2
# 		else 
# 			@active_player = p1
# 		end
# 	end

# 	def check_winner
# 		if board.winner?(p1.marker)
# 			true
# 		elsif board.winner?(p2.marker)
# 			true
# 		elsif
# 			false
# 		end
# 	end

# 	def check_tie
# 		if board.full_board?
# 			true
# 		else
# 			false
# 		end
# 	end





get '/' do 
	erb :players_input
end

post '/players' do
	player1 = params[:p1_input].to_i
	player2 = params[:p2_input].to_i
	pos0 = "#{board.ttt_board[0]}"
	pos1 = "#{board.ttt_board[1]}"
	pos2 = "#{board.ttt_board[2]}"
	pos3 = "#{board.ttt_board[3]}"
	pos4 = "#{board.ttt_board[4]}"
	pos5 = "#{board.ttt_board[5]}"
	pos6 = "#{board.ttt_board[6]}"
	pos7 = "#{board.ttt_board[7]}"
	pos8 = "#{board.ttt_board[8]}"

		if player1 == 1
			p1 = User.new('x')
		elsif player1 == 2
			p1 = Sequential_AI.new('x')
		elsif player1 == 3
			p1 = Random_AI.new('x')
		elsif player1 == 4
			p1 = Unbeatable_AI.new('x')		
		end


		if player2 == 1
			p2 = User.new('o')
		elsif player2 == 2
			p2 = Sequential_AI.new('o')
		elsif player2 == 3
			p2 = Random_AI.new('o')
		elsif player2 == 4
			p2 = Unbeatable_AI.new('o')		
		end
		erb :board, :locals => {:player1 => player1, :player2 => player2, :pos0 => pos0, :pos1 => pos1, :pos2 => pos2, :pos3 => pos3, :pos4 => pos4, :pos5 => pos5, :pos6 => pos6, :pos7 => pos7, :pos8 => pos8}

end

post '/board' do
	backend_p1 = params[:p1]
	backend_p2 = params[:p2]
	position0 = params[:pos0]
	position1 = params[:pos1]
	position2 = params[:pos2]
	position3 = params[:pos3]
	position4 = params[:pos4]
	position5 = params[:pos5]
	position6 = params[:pos6]
	position7 = params[:pos7]
	position8 = params[:pos8]




	# game.create_board

		# if backend_p1 == 1
		# 	p1 = User.new('x')
		# elsif backend_p1 == 2
		# 	p1 = Sequential_AI.new('x')
		# elsif backend_p1 == 3
		# 	p1 = Random_AI.new('x')
		# elsif backend_p1 == 4
		# 	p1 = Unbeatable_AI.new('x')		
		# end


		# if backend_p2 == 1
		# 	p2 = User.new('o')
		# elsif backend_p2 == 2
		# 	p2 = Sequential_AI.new('o')
		# elsif backend_p2 == 3
		# 	p2 = Random_AI.new('o')
		# elsif backend_p2 == 4
		# 	p2 = Unbeatable_AI.new('o')		
		# end
end








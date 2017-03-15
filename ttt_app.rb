require 'sinatra'
require_relative 'board'
require_relative 'sequential'
require_relative 'random'
require_relative 'unbeatable'

enable :sessions

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
	session[:opponent] = params[:opponent]
	board = Board.new
	pos0 = "#{board.ttt_board[0]}"
	pos1 = "#{board.ttt_board[1]}"
	pos2 = "#{board.ttt_board[2]}"
	pos3 = "#{board.ttt_board[3]}"
	pos4 = "#{board.ttt_board[4]}"
	pos5 = "#{board.ttt_board[5]}"
	pos6 = "#{board.ttt_board[6]}"
	pos7 = "#{board.ttt_board[7]}"
	pos8 = "#{board.ttt_board[8]}"

		erb :board, :locals => {:opponent => session[:opponent], :board => board, :pos0 => pos0, :pos1 => pos1, :pos2 => pos2, :pos3 => pos3, :pos4 => pos4, :pos5 => pos5, :pos6 => pos6, :pos7 => pos7, :pos8 => pos8}

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
	


end








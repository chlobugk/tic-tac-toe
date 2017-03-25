require 'sinatra'
require_relative 'board'
require_relative 'user'
require_relative 'sequential'
require_relative 'random'
require_relative 'unbeatable'

enable :sessions


get '/' do 
	session[:board] = Board.new
	erb :players_input
end


post '/players' do

	session[:p1] = User.new('X')
	session[:active_player] = session[:p1]
	opponent = params[:opponent]

		if opponent == 'Human'
			session[:opp] = User.new('O')
			session[:human] = 'fill_human'

		elsif opponent == 'Sequential'
			session[:opp] = Sequential_AI.new('O')

		elsif opponent == 'Random'
			session[:opp] = Random_AI.new('O')

		else opponent == 'Unbeatable'
			session[:opp] = Unbeatable_AI.new('O')
		end

		if session[:human] == 'fill_human'
			# erb :move, :locals => {:active_player => session[:active_player], :board => session[:board].update_board}
			redirect '/board'

		else 
			redirect '/move'
		end
end


get '/board' do

	erb :board, :locals => {:board => session[:board], :p1 => session[:p1], :opponent => session[:opp], :active_player => session[:active_player]}
	# move = session[:active_player].fill_move(session[:board].ttt_board)
end


get '/move' do
	move = session[:active_player].fill_move(session[:board].ttt_board)
	session[:board].update_position((move.to_i), session[:active_player].marker)
	
		if session[:board].winner?(session[:active_player].marker)
			erb :win
		elsif session[:board].full_board?
			erb :tie
		else
			if session[:active_player] == session[:p1]
				session[:active_player] = session[:opp]
			else
				session[:active_player] = session[:p1]
			end

			if session[:active_player] == session[:p1] || session[:active_player] == session[:opp] && session[:human] == 'fill_human'
				redirect '/board'
			else
				redirect '/move'
			end
		end

end


post '/move' do
	move = params[:square].to_i
	move -= 1

	if session[:board].valid_position?(move)
		session[:board].update_position(square, session[:active_player].marker)

		if session[:board].winner?(session[:active_player].marker)
			erb :win
		elsif session[:board].full_board?
			erb :tie
		else
			if session[:active_player] == session[:p1]
				session[:active_player] = session[:opp]
			else
				session[:active_player] = session[:p1]
			end

			if session[:active_player] == session[:p1] || session[:active_player] == session[:opp] && session[:human] == 'fill_human'
				redirect '/board'
			else
				redirect '/move'
			end
		end
	else
		redirect '/board'
	end
end







# redirect '/players?opponent=' + opponent + ''
	# backend_p1 = params[:p1]
	# backend_p2 = params[:p2]
	# position0 = params[:pos0]
	# position1 = params[:pos1]
	# position2 = params[:pos2]
	# position3 = params[:pos3]
	# position4 = params[:pos4]
	# position5 = params[:pos5]
	# position6 = params[:pos6]
	# position7 = params[:pos7]
	# position8 = params[:pos8]






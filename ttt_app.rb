require 'sinatra'
require_relative 'tic_tac_board.rb'
require_relative 'player_classes'

enable :sessions


get '/' do 
	session[:board] = nil
	session[:board] = Board_App.new
	erb :players_input
end


post '/players' do

	session[:p1] = User_App.new('X')
	session[:active_player] = session[:p1]
	opponent = params[:opponent]
	session[:human] = nil

		if opponent == 'Human'
			session[:opp] = User_App.new('O')
			session[:human] = 'fill_human'

		elsif opponent == 'Sequential'
			session[:opp] = Sequential_App.new('O')

		elsif opponent == 'Random'
			session[:opp] = Random_App.new('O')

		else opponent == 'Unbeatable'
			session[:opp] = Unbeatable_App.new('O')
		end

		redirect '/board'
end


get '/board' do

	erb :board, :locals => {:board => session[:board], :p1 => session[:p1], :opponent => session[:opp], :active_player => session[:active_player]}
	# move = session[:active_player].fill_move(session[:board].ttt_board)
end


get '/move' do
	move = session[:active_player].fill_move(session[:board].ttt_board)
	# session[:board].update_position((move), session[:active_player].marker)
	session[:board].update_position(move, session[:active_player].marker)

	redirect '/check_game'
end


post '/user_move' do
	move = params[:square].to_i
	move -= 1

	if session[:board].open_position?(move)
		session[:board].update_position(move, session[:active_player].marker)
		redirect '/check_game'
	else
		redirect '/board'
	end
end



get '/check_game' do

	if session[:board].winner?(session[:active_player].marker)
		erb :win, :locals => {:active_player => session[:active_player].marker}
	elsif session[:board].full_board?
		erb :tie
	else
		redirect '/change_player'
	end
end



get '/change_player' do

	if session[:active_player] == session[:p1]
		session[:active_player] = session[:opp]
	else
		session[:active_player] = session[:p1]
	end

	if session[:active_player] == session[:p1] || (session[:active_player] == session[:opp] && session[:human] == 'fill_human')
		redirect '/board'
	else
		redirect '/move'
	end
end







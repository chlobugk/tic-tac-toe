require 'sinatra'
require_relative 'play_game'

get '/' do 
	erb :p1_input
end

post '/player1' do

	player1 = params[:p1_input].to_i
	player2 = params[:p2_input].to_i
	p1 = choose_p1
	p2 = choose_p2

end

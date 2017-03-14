require 'sinatra'
require_relative 'play_game'

get '/' do 
	erb :players_input
end

post '/players' do

	player1 = params[:p1_input]
	player2 = params[:p2_input]
	erb :board

end

post '/board' do
	backend_p1 = params[:p1_input].to_i
	backend_p2 = params[:p2_input].to_i

		if backend_p1 == 1
			p1 = User.new('x')
		elsif backend_p1 == 2
			p1 = Sequential_AI.new('x')
		elsif backend_p1 == 3
			p1 = Random_AI.new('x')
		elsif backend_p1 == 4
			p1 = Unbeatable_AI.new('x')
		else
			puts "Oops, please pick 1, 2, 3, or 4."
			choose_p1		
		end
end








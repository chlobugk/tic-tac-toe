require 'sinatra'
require_relative 'game'

@game = ConsoleGame.new

get '/' do 
	erb :players_input
end

post '/players' do
	player1 = params[:p1_input].to_i
	player2 = params[:p2_input].to_i
	pos0 = ' '
	pos1 = ' '
	pos2 = ' '
	pos3 = ' '
	pos4 = ' '
	pos5 = ' '
	pos6 = ' '
	pos7 = ' '
	pos8 = ' '

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








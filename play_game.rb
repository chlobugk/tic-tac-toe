require_relative 'game.rb'

p1 = Random_AI.new('X')
p2 = Sequential_AI.new('O')

game = ConsoleGame.new(p1, p2)

game.intro

until game.board.winner?(p1 || p2) || game.board.full_board?

	game.fill_move
	game.update_position
	game.change_player
end

game.create_board

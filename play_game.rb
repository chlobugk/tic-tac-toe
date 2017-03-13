require_relative 'game.rb'

# p1 = Random_AI.new('X')
# p2 = User.new('O')

game = ConsoleGame.new

game.intro

until game.check_tie || game.check_winner 
game.create_board
game.update_position
game.change_player
end
game.create_board

if game.check_winner
	game.change_player
	puts "#{game.active_player.marker} wins!"
elsif 
	puts "It's a tie game folks!"
end



require_relative 'game.rb'

# p1 = Random_AI.new('X')
# p2 = User.new('O')

$p1 = ''
$p2 = ''

def choose_p1
	puts "Select player X by entering 1-3. Human = 1; Random_Computer = 2; Sequential_Computer = 3"
	player1 = gets.chomp.to_i

	if player1 == 1
		$p1 = User.new('X')
	elsif player1 == 2
		$p1 = Random_AI.new('X')
	elsif player1 ==3
		$p1 = Sequential_AI.new('X')
	elsif 
		puts "Invalid, please pick 1, 2, or 3."
		choose_p1		
	end
end

def choose_p2
	puts "Select player O by entering 1-3. Human = 1; Random_Computer = 2; Sequential_Computer = 3"
	player2 = gets.chomp.to_i

	if player2 == 1
		$p2 = User.new('O')
	elsif player2 == 2
		$p2 = Random_AI.new('O')
	elsif player2 ==3
		$p2 = Sequential_AI.new('O')
	elsif 
		puts "Invalid, please pick 1, 2, or 3."
		choose_p2		
	end
end


choose_p1
choose_p2

game = ConsoleGame.new($p1, $p2)

game.intro

until game.check_tie || game.check_winner 
game.create_board
game.fill_move
game.update_position
game.change_player
end
game.create_board



class Unbeatable_AI
require_relative 'board.rb'

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end


	def check_fork(ttt_board)
	
		fork_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 

			fork_pos = [
				[ttt_board[0], ttt_board[1], ttt_board[2]], 
				[ttt_board[3], ttt_board[4], ttt_board[5]],
				[ttt_board[6], ttt_board[7], ttt_board[8]], 
				[ttt_board[0], ttt_board[3], ttt_board[6]],
				[ttt_board[1], ttt_board[4], ttt_board[7]],
				[ttt_board[2], ttt_board[5], ttt_board[8]], 
				[ttt_board[0], ttt_board[4], ttt_board[8]],
				[ttt_board[2], ttt_board[4], ttt_board[6]]
						]
		
			ind = []
			fork_pos.each_with_index do |fork_combo, fork_index|
				if fork_combo.count(marker) == 1 && fork_combo.count(' ') == 2
					ind << fork_index #ind now contains the index of all rows (from fork_pos) that have 1 spot filled
				end
			end

			fork_square = []
			ind.each do |index| #this is each index number of a row with 1 spot filled
				fork_square << fork_array[index] #fork_square now contains combos in fork_array
			end

			result_array = []
			fork_square = fork_square.flatten.sort #flatten turns multidimensional array into 1 array; sort puts in order (board positions that are in array)
			fork_square.each do |square|
				if ttt_board[square] == ' '
					result_array << square #result_array contains all positions that work and are empty
				end
			end

			if result_array.find { |combo| result_array.count(combo) > 1 } == nil #checks if a match is found
				move = 9
			else
				move = result_array.find { |combo| result_array.count(combo) > 1 } #if match is found it takes the move
			end
			move


	end



	def fill_move(ttt_board)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 

			board_pos = [
				[ttt_board[0], ttt_board[1], ttt_board[2]],
				[ttt_board[3], ttt_board[4], ttt_board[5]],
				[ttt_board[6], ttt_board[7], ttt_board[8]],
				[ttt_board[0], ttt_board[3], ttt_board[6]],
				[ttt_board[1], ttt_board[4], ttt_board[7]],
				[ttt_board[2], ttt_board[5], ttt_board[8]],
				[ttt_board[0], ttt_board[4], ttt_board[8]],
				[ttt_board[2], ttt_board[4], ttt_board[6]]
						]

				marker1 = 'x'
				marker2 = 'o'

				if marker == marker1
					opponent = marker2
				else
					opponent = marker1
				end

	
			results = ttt_board.index(' ')
			board_pos.each_with_index do |win_combo, index|

				if win_combo.count(marker) == 2 && win_combo.count(' ') == 1
					winning_index = win_combo.index(' ')
					results = win_array[index][winning_index]
				elsif win_combo.count(opponent) == 2 && win_combo.count(' ') == 1
					winning_index = win_combo.index(' ')
					results = win_array[index][winning_index]
				# elsif (check_fork(ttt_board) < 9)
				# 	results = check_fork(ttt_board)
				else
					results
				end
			end
			results


			

	

	end

	# elsif fork_pos.each_with_index do |fork_combo, f_index|
				# 	if fork_combo.count(marker) == 2 && fork_combo.count(' ') == 1
				# 		fork_index = fork_combo.index(' ')
				# 		results = fork_array[f_index][fork_index]
				# 	else
				# 		results
				# 	end

		
		




end
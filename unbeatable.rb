class Unbeatable_AI
require_relative 'board.rb'

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end



	def fill_move(ttt_board)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 
		fork_array = [[0, 1, 4], [0, 3, 4], [1, 2, 4], [2, 4, 5], [3, 4, 6], [4, 6, 7], [4, 5, 8], [4, 7, 8], [0, 1, 3], [1, 2, 5], [3, 6, 7], [5, 7, 8], [0, 2, 6], [0, 2, 8], [0, 6, 8], [2, 6, 8], [0, 2, 4], [0, 4, 6], [4, 6, 8], [2, 4, 8]]

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
			fork_pos = [
				[ttt_board[0], ttt_board[1], ttt_board[4]],
				[ttt_board[0], ttt_board[3], ttt_board[4]],
				[ttt_board[1], ttt_board[2], ttt_board[4]],
				[ttt_board[2], ttt_board[4], ttt_board[5]],
				[ttt_board[3], ttt_board[4], ttt_board[6]],
				[ttt_board[4], ttt_board[6], ttt_board[7]],
				[ttt_board[4], ttt_board[5], ttt_board[8]],
				[ttt_board[4], ttt_board[7], ttt_board[8]],
				[ttt_board[0], ttt_board[1], ttt_board[3]], 
				[ttt_board[1], ttt_board[2], ttt_board[5]], 
				[ttt_board[3], ttt_board[6], ttt_board[7]], 
				[ttt_board[5], ttt_board[7], ttt_board[8]], 
				[ttt_board[0], ttt_board[2], ttt_board[6]],
				[ttt_board[0], ttt_board[2], ttt_board[8]], 
				[ttt_board[0], ttt_board[6], ttt_board[8]], 
				[ttt_board[2], ttt_board[6], ttt_board[8]], 
				[ttt_board[0], ttt_board[2], ttt_board[4]],
				[ttt_board[0], ttt_board[4], ttt_board[6]],
				[ttt_board[4], ttt_board[6], ttt_board[8]], 
				[ttt_board[2], ttt_board[4], ttt_board[8]]
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
				elsif ttt_board[4] == ' '
					results = 4
				elsif fork_pos.each_with_index do |fork_combo, f_index|
					if fork_combo.count(marker) == 2 && fork_combo.count(' ') == 1
						fork_index = fork_combo.index(' ')
						results = fork_array[f_index][fork_index]
					else
						results
					end
					end
				else
					results
				end
			end
			results


			

	

	end

		
		




end
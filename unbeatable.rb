class Unbeatable_AI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
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

				p win_combo
				
				if win_combo.count(marker) == 2 && win_combo.count(' ') == 1
					winning_index = win_combo.index(' ')
					results = win_array[index][winning_index]
				elsif win_combo.count(opponent) == 2 && win_combo.count(' ') == 1
					winning_index = win_combo.index(' ')
					results = win_array[index][winning_index]
				else
					results
				end

			end
			results

	

	end

		
		




end
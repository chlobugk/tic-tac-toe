class Sequential_AI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def fill_move(board)
		board.index(' ')
	end
end

# def fill_seq(comp)

	# 	position = 0

	# 	ttt_board.length.times do

	# 		if ttt_board[position] == ''
	# 			ttt_board[position] = comp 
	# 			break
	# 		else 
	# 			position += 1
	# 		end
	# 	end
	# end
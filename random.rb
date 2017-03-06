class Random_AI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def fill_move(board)
		
		board.each_index.select{ |empty| board[empty] == ' '}.sample
	end
end


	# def fill_rand(comp)

	# 	ttt_board.length.times do

	# 		positions = [0,1,2,3,4,5,6,7,8,9].shuffle
	
	# 		position = positions[0]

	# 		if ttt_board[position] == ''
	# 			ttt_board[position] = comp 
	# 			break
	# 		end
	# 	end
		
	# end

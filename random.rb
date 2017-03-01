class Random_AI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def fill_move(board)
		board.each_index.select{ |empty| board[empty] == ''}.sample
	end
end
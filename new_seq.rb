class Sequential_AI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def fill_move(board)
		board.index { |x| x.is_a?(Integer) }
	end
end

class User

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end
	
	def fill_move(board)
		"fill_human"
	end
end
class User

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def fill_move(board)
		print 'Choose 0-8 to pick your square: '
		position = gets.chomp.to_i
	end

end
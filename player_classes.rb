class Players

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end
end


class User < Players
	attr_accessor :marker
end


class Sequential_AI
	attr_accessor :marker
	def fill_move(board)
		board.index { |x| x.is_a?(Integer) }
	end
end

# class Random_AI
# 	attr_accessor :marker
	





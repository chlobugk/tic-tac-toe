class Players

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end
end


class User_App < Players
	attr_accessor :marker
end


# class Sequential_App < Players
# 	attr_accessor :marker
# 	def fill_move(board)
# 		board.index { |x| x.is_a?(Integer) }
# 	end
# end

# class Random_App < Players
# 	attr_accessor :marker
# 	def fill_move(board)
# 	options = []

# 		board.each_with_index do |val, pos|
# 			if val.is_a?(Integer)
# 				options << pos
# 			end
# 		end
# 		options.sample
# 	end
# end







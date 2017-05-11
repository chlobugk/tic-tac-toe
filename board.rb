class Board

	attr_accessor :ttt_board, :number

	def initialize(number)
		@number = number.to_i
		num = number.to_i * number.to_i
		@ttt_board = *(1..num)
	end


	def update_position(position, marker)
		ttt_board[position] = marker
	end

	def board_pos()
		array_board = []
		ttt_board.each_with_index do |value, index|
			if value == 'X' || value == 'O'
				array_board << value
			else
				array_board << (index + 1)
			end
		end
		array_board
	end


	def open_position?(position)
		if ttt_board[position] != 'X' && ttt_board[position] != 'O'
			true
		else
			false 
		end
	end


	def valid_input?(input)

		if input.match(/[XxOo]/) && input.length == 1
			true
		else
			false
		end
	end


	def full_board?()
		if ttt_board.all? { |x| x.is_a?(String) }
			true
		else
			false
		end

	end


	def winner?(marker)

	win_array = []

	# finds horizontals
	pos = -1
	until win_array.length == number
		array = []
		until array.length == number
		pos +=1
		array << pos
		end
		win_array << array
	end

	#finds verticals
	pos = 0
	column = -1
	until win_array.length == number * 2
		column += 1
		pos = column
		array = []
		array << pos
		until array.length == number
		pos += number
		array << pos
		end
		win_array << array
	end

	#1st diagonal
	pos = 0
	array = []
	array << pos
	diag = number + 1
	until array.length == number
		pos += diag
		array << pos
	end
	win_array << array

	#2nd diagonal
	pos = number - 1
	array = []
	array << pos
	diag = number - 1
	until array.length == number
		pos += diag
		array << pos
	end
	win_array << array


	results = false

		win_array.each do |win|
			row = 0

			win.each do |pos|


				if ttt_board[pos] == marker
					row += 1

					if row == number
						results = true
					end
				end
			end
		end
		results
	end



end



# class Player

# 	attr_accessor :name, :marker

# 	def initialize
# 		print 'Enter your name here: '
# 		@name = gets.chomp

# 		print 'Enter X or O to choose your marker: '
# 		@marker = gets.chomp
# 	end


# end


# class Game


# 	def final_game(marker)
		
# 		final = open_position?(marker)
# 		valid_input?(final)

# 			if winner?(final) == true
# 				print @name + ' wins!'
# 			else 
# 				print 'Tie game!'
# 			end
# 	end

# end





	 









require 'minitest/autorun'
require_relative 'board.rb'

class TestTicTacToe < MiniTest::Test 
	def test_new_board
		board = Board.new(3) 
		assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9], board.ttt_board)
	end

	def test_input_4
		board = Board.new(4)
		assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], board.ttt_board)
	end

	def test_create_27x27_board
		board = Board.new(27)
		assert_equal(729, board.ttt_board.length)
	end

	def test_update_1st_pos
		board = Board.new(3)
		board.update_position(0, 'X')
		assert_equal(['X', 2, 3, 4, 5, 6, 7, 8, 9], board.ttt_board)
	end

	def test_update_2nd_pos
		board = Board.new(2)
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', 3, 4], board.ttt_board)
	end

	def test_update_partial_board_at_last_pos
		board = Board.new(3)
		board.ttt_board = ['X', 2, 'O', 4, 'O', 'X', 'X', 'O', 9]
		board.update_position(8, 'X')
		assert_equal(['X', 2, 'O', 4, 'O', 'X', 'X', 'O', 'X'], board.ttt_board)
	end

	def test_check_spot_available_true
		board = Board.new(3)
		board.ttt_board = ['X', 2, 'O', 4, 'O', 'X', 'X', 'O', 9]
		assert_equal(true, board.open_position?(1))
		assert_equal(false, board.open_position?(2))
	end

	def test_full_board
		board = Board.new(3)
		board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'X', 7, 'O', 'X']
		assert_equal(false, board.full_board?)
	end

	def test_full_board_true
		board = Board.new(3)
		board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X']
		assert_equal(true, board.full_board?)
	end

	def test_valid_input
		board = Board.new(5)
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('x'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(false, board.valid_input?(''))
		assert_equal(false, board.valid_input?('@'))
		assert_equal(true, board.valid_input?('X'))
	end

	def test_winner_at_pos_012_with_X
		board = Board.new(3)
		marker = 'X'
		board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 7, 8, 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_winner_at_pos_048_with_x
		board = Board.new(3)
		marker = 'x'
		board.ttt_board = ['x', 2, 'o', 'x', 'x', 'x', 7, 'o', 'o']
		assert_equal(true, board.winner?(marker))
	end

	def test_no_winner
		board = Board.new(3)
		marker = 'o'
		board.ttt_board = ['x', 'o', 'x', 'o', 'o', 'x', 'o', 'x', 'o']
		assert_equal(false, board.winner?(marker))
	end

	def test_win_at_12_13_14_15
		board = Board.new(4)
		marker = 'o'
		board.ttt_board = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 'o', 'o', 'o', 'o']
		assert_equal(true, board.winner?(marker))
	end

	def test_win_at_3_7_11_15
		board = Board.new(4)
		marker = 'o'
		board.ttt_board = [1, 2, 3, 'o', 5, 6, 7, 'o', 9, 10, 11, 'o', 13, 14, 15, 'o']
		assert_equal(true, board.winner?(marker))
	end

	def test_win_at_0_5_10_15
		board = Board.new(4)
		marker = 'x'
		board.ttt_board = ['x', 2, 3, 'o', 5, 'x', 7, 8, 9, 10, 'x', 'o', 13, 14, 15, 'x']
		assert_equal(true, board.winner?(marker))
	end

	def test_win_at_3_6_9_12
		board = Board.new(4)
		marker = 'o'
		board.ttt_board = [1, 2, 3, 'o', 5, 6, 'o', 8, 9, 'o', 11, 12, 'o', 14, 15, 16]
		assert_equal(true, board.winner?(marker))
	end

end











# class TestPlayerMarker < MiniTest::Test 

# 	def test_player_info
# 		player = Player.new
# 		assert_equal('Chloe', player.name)
# 		assert_equal('X', player.marker)
# 	end

# end



# class TestGame < MiniTest::Test 

# 	def test_player2_wins
# 		board = Board.new
# 		marker = 'X'
# 		board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X']
# 		assert_equal('Chloe', player.name)
# 		assert_equal('X', player.marker)
# 		assert_equal('Chloe wins!', board.final_game(marker))
# 	end


# end
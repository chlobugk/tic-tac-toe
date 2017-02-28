require 'minitest/autorun'
require_relative 'board.rb'

class TestTicTacToe < MiniTest::Test 
	def test_new_board
		board = Board.new 
		assert_equal(Array.new(9, ''), board.ttt_board)
	end

	def test_update_1st_pos
		board = Board.new
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_2nd_pos
		board = Board.new
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_pos
		board = Board.new
		board.ttt_board = ['X', '', 'O', '', 'O', 'X', 'X', 'O', '']
		board.update_position(8, 'X')
		assert_equal(['X', '', 'O', '', 'O', 'X', 'X', 'O', 'X'], board.ttt_board)
	end

	def test_check_spot_available_true
		board = Board.new
		board.ttt_board = ['X', '', 'O', '', 'O', 'X', 'X', 'O', '']
		assert_equal(true, board.open_position?(1))
		assert_equal(false, board.open_position?(2))
		assert_equal(false, board.open_position?(15))
		assert_equal(true, board.open_position?(-1))
	end

	def test_full_board
		board = Board.new
		board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'X', '', 'O', 'X']
		assert_equal(false, board.full_board?)
	end

	def test_full_board_true
		board = Board.new
		board.ttt_board = ['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X']
		assert_equal(true, board.full_board?)
	end

	def test_valid_input
		board = Board.new
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('x'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(false, board.valid_input?(''))
		assert_equal(false, board.valid_input?('@'))
		assert_equal(true, board.valid_input?('X'))
	end

	def test_winner_at_pos_012_with_X
		board = Board.new
		marker = 'X'
		board.ttt_board = ['X', 'X', 'X', 'O', 'X', 'O', 'O', 'X', 'X']
		assert_equal(true, board.winner?(marker))
	end

	def test_winner_at_pos_048_with_x
		board = Board.new
		marker = 'x'
		board.ttt_board = ['x', 'x', 'o', 'o', 'x', 'x', 'o', 'o', 'x']
		assert_equal(true, board.winner?(marker))
	end

	def test_no_winner
		board = Board.new
		marker = 'o'
		board.ttt_board = ['x', 'o', 'x', 'o', 'o', 'x', 'o', 'x', 'o']
		assert_equal(false, board.winner?(marker))
	end





end
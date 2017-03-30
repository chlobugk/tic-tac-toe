require 'minitest/autorun'
require_relative 'tic_tac_board.rb'

class TestTicTacToe < MiniTest::Test 
	def test_new_board
		board = Board_App.new 
		board_array = *(1..9)
		assert_equal(board_array, board.ttt_board)
	end

	def test_update_1st_pos
		board = Board_App.new
		board.update_position(2, 'O')
		assert_equal([1, 2, 'O', 4, 5, 6, 7, 8, 9], board.ttt_board)
	end
end
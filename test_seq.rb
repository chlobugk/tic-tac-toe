require 'minitest/autorun'
require_relative 'sequential.rb'

class TestTTTSequential < MiniTest::Test 

	def test_create_player
		player = Sequential_AI.new('X')
		assert_equal('X', player.marker)
	end

	def test_fill_1st_spot
		player = Sequential_AI.new('X')
		assert_equal(1, player.fill_move(['X', '', '', '', '', '', '', '', '']))
	end

	def test_0to6_results_7
		player = Sequential_AI.new('X')
		assert_equal(7, player.fill_move(['X', 'X', 'X', 'X', 'X', 'X', 'X', '']))
	end
end

# class TestSequentialComp < MiniTest::Test 

# 	def test_fills_1st_spot
# 		board = Board.new
# 		board.ttt_board = ['', '', 'o', 'o', '', 'x', '', 'x', 'x']
# 		comp = 'o'
# 		board.fill_seq(comp)
# 		assert_equal(['o', '', 'o', 'o', '', 'x', '', 'x', 'x'], board.ttt_board)
# 	end

# 	def test_fills_3rd_spot
# 		board = Board.new
# 		board.ttt_board = ['o', 'x', '', 'o', 'o', '', '', 'x', 'x']
# 		comp = 'x'
# 		board.fill_seq(comp)
# 		assert_equal(['o', 'x', 'x', 'o', 'o', '', '', 'x', 'x'], board.ttt_board)
# 	end

# 	def test_fills_last_spot
# 		board = Board.new
# 		board.ttt_board = ['x', 'x', 'o', 'o', 'o', 'x', 'o', 'x', '']
# 		comp = 'x'
# 		board.fill_seq(comp)
# 		assert_equal(['x', 'x', 'o', 'o', 'o', 'x', 'o', 'x', 'x'], board.ttt_board)
# 	end

# end

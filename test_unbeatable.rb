require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatable < MiniTest::Test 

	def test_new_player_x
		player = Unbeatable_AI.new('x')
		assert_equal('x', player.marker)
	end

	def test_win
		player = Unbeatable_AI.new('x') 
		ttt_board = ['x', 'x', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(2, player.win(ttt_board))
	end

	def test_win_at_last_pos
		player = Unbeatable_AI.new('x') 
		ttt_board = [' ', ' ', ' ', ' ', ' ', ' ', 'x', 'x', ' ']
		assert_equal(8, player.win(ttt_board))
	end

	def test_win_at_4
		player = Unbeatable_AI.new('x') 
		ttt_board = ['x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x']
		assert_equal(4, player.win(ttt_board))
	end

	def test_no_win_x
		player = Unbeatable_AI.new('x') 
		ttt_board = ['x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(9, player.win(ttt_board))
	end

	def test_win_at_5
		player = Unbeatable_AI.new('o') 
		ttt_board = [' ', ' ', ' ', 'o', 'o', ' ', ' ', ' ', ' ']
		assert_equal(5, player.win(ttt_board))
	end

	def test_no_win_o
		player = Unbeatable_AI.new('o') 
		ttt_board = [' ', ' ', ' ', ' ', 'x', ' ', ' ', ' ', 'o']
		assert_equal(9, player.win(ttt_board))
	end

	def test_block1
		player = Unbeatable_AI.new('x') 
		ttt_board = ['o', 'o', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(2, player.block(ttt_board))
	end

	def test_block2
		player = Unbeatable_AI.new('x') 
		ttt_board = ['o', '  ', ' ', ' ', 'o', ' ', ' ', 'x', ' ']
		assert_equal(8, player.block(ttt_board))
	end

	def test_x_and_o_battle
		player = Unbeatable_AI.new('o') 
		ttt_board = ['o', 'o', ' ', ' ', ' ', 'x', ' ', ' ', 'x']
		assert_equal(2, player.block(ttt_board))
	end

	def test_fork
		player = Unbeatable_AI.new('x')
		ttt_board = [' ', 'x', ' ', ' ', 'o', 'x', ' ', 'o', ' ']
		assert_equal(2, player.check_fork(ttt_board))
	end

	def test_fork_4
		player = Unbeatable_AI.new('x')
		ttt_board = ['x', 'o', ' ', 'o', ' ', ' ', 'x', ' ', ' ']
		assert_equal(4, player.check_fork(ttt_board))
	end

	def test_block_fork_2
		player = Unbeatable_AI.new('o')
		ttt_board = [' ', 'x', ' ', ' ', 'o', 'x', ' ', 'o', ' ']
		assert_equal(2, player.block_fork(ttt_board))
	end

	def test_block_fork_4
		player = Unbeatable_AI.new('x')
		ttt_board = ['x', 'o', ' ', 'o', ' ', ' ', ' ', ' ', 'x']
		assert_equal(4, player.block_fork(ttt_board))
	end

	def test_X_blocks_O_corners_opposite
		player = Unbeatable_AI.new('x')
		ttt_board = ['o', ' ', ' ', ' ', 'x', ' ', ' ', ' ', 'o']
		assert_equal(3, player.block_fork(ttt_board))
	end

	def test_X_blocks_O_corners
		player = Unbeatable_AI.new('o')
		ttt_board = [' ', ' ', 'x', ' ', 'o', ' ', 'x', ' ', ' ']
		assert_equal(3, player.block_fork(ttt_board))
	end

	def test_take_center
		player = Unbeatable_AI.new('x')
		ttt_board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(4, player.center(ttt_board))
	end

	def test_take_center_with_x_on_board
		player = Unbeatable_AI.new('o')
		ttt_board = [' ', ' ', 'x', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(4, player.center(ttt_board))
	end

	def test_centers_already_taken
		player = Unbeatable_AI.new('x')
		ttt_board = [' ', ' ', ' ', ' ', 'o', ' ', ' ', ' ', ' ']
		assert_equal(9, player.center(ttt_board))
	end

	def test_opp_corner_8
		player = Unbeatable_AI.new('x')
		ttt_board = ['o', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(8, player.opposite_corner(ttt_board))
	end

	def test_opp_corner_6
		player = Unbeatable_AI.new('o')
		ttt_board = [' ', ' ', 'x', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(6, player.opposite_corner(ttt_board))
	end

	def test_opp_corner_2
		player = Unbeatable_AI.new('x')
		ttt_board = [' ', ' ', ' ', 'x', ' ', ' ', 'o', ' ', ' ']
		assert_equal(2, player.opposite_corner(ttt_board))
	end

	def test_opp_corner_0
		player = Unbeatable_AI.new('o')
		ttt_board = [' ', ' ', 'o', ' ', ' ', ' ', ' ', ' ', 'x']
		assert_equal(0, player.opposite_corner(ttt_board))
	end

	def test_opp_corner_taken
		player = Unbeatable_AI.new('o')
		ttt_board = ['x', ' ', ' ', ' ', 'o', ' ', ' ', ' ', 'x']
		assert_equal(9, player.opposite_corner(ttt_board))
	end

	def test_take_corner_2
		player = Unbeatable_AI.new('o')
		ttt_board = ['x', ' ', ' ', ' ', 'o', ' ', 'o', ' ', 'x']
		assert_equal(2, player.empty_corner(ttt_board))
	end

	def test_take_corner_8
		player = Unbeatable_AI.new('o')
		ttt_board = ['x', ' ', 'o', ' ', ' ', ' ', 'x', ' ', ' ']
		assert_equal(8, player.empty_corner(ttt_board))
	end

	def test_no_corners
		player = Unbeatable_AI.new('o')
		ttt_board = ['x', ' ', 'o', ' ', ' ', ' ', 'o', ' ', 'x']
		assert_equal(9, player.empty_corner(ttt_board))
	end

	def test_empty_side_1
		player = Unbeatable_AI.new('o')
		ttt_board = ['x', ' ', 'o', 'x', ' ', ' ', 'o', ' ', 'x']
		assert_equal(1, player.empty_side(ttt_board))
	end

	def test_empty_side_7
		player = Unbeatable_AI.new('o')
		ttt_board = ['x', 'x', 'o', 'x', ' ', 'o', 'o', ' ', 'x']
		assert_equal(7, player.empty_side(ttt_board))
	end
end
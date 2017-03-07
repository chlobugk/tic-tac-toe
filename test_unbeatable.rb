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
		assert_equal(2, player.fill_move(ttt_board))
	end

	def test_win_at_last_pos
		player = Unbeatable_AI.new('x') 
		ttt_board = [' ', ' ', ' ', ' ', ' ', ' ', 'x', 'x', ' ']
		assert_equal(8, player.fill_move(ttt_board))
	end

	def test_win_at_4
		player = Unbeatable_AI.new('x') 
		ttt_board = ['x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'x']
		assert_equal(4, player.fill_move(ttt_board))
	end

	def test_no_win_x
		player = Unbeatable_AI.new('x') 
		ttt_board = ['x', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(4, player.fill_move(ttt_board))
	end

	def test_win_at_5
		player = Unbeatable_AI.new('o') 
		ttt_board = [' ', ' ', ' ', 'o', 'o', ' ', ' ', ' ', ' ']
		assert_equal(5, player.fill_move(ttt_board))
	end

	def test_no_win_o
		player = Unbeatable_AI.new('o') 
		ttt_board = [' ', ' ', ' ', ' ', 'x', ' ', ' ', ' ', 'o']
		assert_equal(0, player.fill_move(ttt_board))
	end

	def test_block1
		player = Unbeatable_AI.new('x') 
		ttt_board = ['o', 'o', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
		assert_equal(2, player.fill_move(ttt_board))
	end

	def test_block2
		player = Unbeatable_AI.new('x') 
		ttt_board = ['o', ' ', ' ', ' ', 'o', ' ', ' ', 'x', ' ']
		assert_equal(8, player.fill_move(ttt_board))
	end

	def test_x_and_o_battle
		player = Unbeatable_AI.new('o') 
		ttt_board = ['o', 'o', ' ', ' ', ' ', 'x', ' ', ' ', 'x']
		assert_equal(2, player.fill_move(ttt_board))
	end

	def test_fork
		player = Unbeatable_AI.new('x')
		ttt_board = [' ', ' ', 'o', ' ', ' ', ' ', '', ' ', ' ']
		assert_equal(4, player.fill_move(ttt_board))
	end


end
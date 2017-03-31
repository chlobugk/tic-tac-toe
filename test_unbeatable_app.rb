require 'minitest/autorun'
require_relative 'unbeatable_for_app.rb'

class TestUnbeatableInput < MiniTest::Test 

	def test_take_win
		player = Unbeatable_App.new('O')
		assert_equal(2, player.win(['O','O',3,4,5,6,7,8,9]))
	end

	def test_take_block
		player = Unbeatable_App.new('X')
		assert_equal(8, player.block(['O',2,'X',4,'O',6,7,8,9]))
	end

	def test_take_fork
		player = Unbeatable_App.new('X')
		assert_equal(2, player.check_fork([1,'X',3,4,'O','X',7,'O',9]))
	end

	def test_block_fork
		player = Unbeatable_App.new('X')
		assert_equal(4, player.block_fork(['X','O',3,'O',5,6,7,8,'X']))
	end

	def test_take_center
		player = Unbeatable_App.new('X')
		assert_equal(4, player.center(['O',2,3,4,5,6,7,8,9]))
	end

	def test_opp_corner
		player = Unbeatable_App.new('X')
		assert_equal(8, player.opposite_corner(['O',2,3,4,5,6,7,8,9]))
	end


end
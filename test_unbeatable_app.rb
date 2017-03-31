require 'minitest/autorun'
require_relative 'unbeatable_for_app.rb'

class TestUnbeatableInput < MiniTest::Test 

	def test_take_win
		player = Unbeatable_App.new('O')
		assert_equal(2, player.win(['O','O',3,4,5,6,7,8,9]))
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
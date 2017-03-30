require 'minitest/autorun'
require_relative 'player_classes.rb'
require_relative 'unbeatable_for_app.rb'

class TestUserInput < MiniTest::Test 

	def test_input_seq
		player = Sequential_App.new('X')
		assert_equal(2, player.fill_move(['X', 'X',3,4,5,6,7,8,9]))
	end

	def test_X_takes_8_when_O1
		player = Unbeatable_App.new('X')
		assert_equal(8, player.opposite_corner(['O',2,3,4,5,6,7,8,9]))
	end
end
require 'minitest/autorun'
require_relative 'player_classes.rb'

class TestUserInput < MiniTest::Test 

	def test_input_seq
		player = Sequential_App.new('X')
		assert_equal(2, player.fill_move(['X', 'X',3,4,5,6,7,8,9]))
	end
end
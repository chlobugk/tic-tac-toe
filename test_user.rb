require 'minitest/autorun'
require_relative 'user.rb'

class TestUserInput < MiniTest::Test 

	def test_input_ok
		player = User.new
		assert_equal(4, player.fill_move(['X', '', '', '', '', '', '', '', '']))
	end
end
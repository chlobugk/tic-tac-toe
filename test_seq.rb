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

require 'minitest/autorun'
require_relative 'random.rb'

class TestTTTRandom < MiniTest::Test 

	def test_create_player
		player = Random_AI.new('X')
		assert_equal('X', player.marker)
	end

	def test_full_but_1
		player = Random_AI.new('X')
		assert_equal(3, player.fill_move(['X', 'X', 'X', '', 'X', 'X', 'X', 'X', 'X']))
	end

	def test_random_blank_space
		player = Random_AI.new('X')
		assert_equal(true, [0, 1, 2].include?(player.fill_move(['', '', '', 'X', 'O', 'X', 'X', 'X', 'X'])))
	end

	def test_random_blank_space_after_3
		player = Random_AI.new('X')
		assert_equal(true, [3, 4, 5, 6, 7, 8].include?(player.fill_move(['X', 'O', 'X', '', '', '', '', '', ''])))	
	end
end
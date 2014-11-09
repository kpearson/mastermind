gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind.rb'

class MasterMindTest < Minitest::Test

  def test_user_sees_welcome_message
    assert_equal "Welcome to MASTERMIND", Player.new.welcome_message
  end

  def test_user_sees_new_game_prompt
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", Player.new.new_game_prompt
  end

  def player_presses_p
    assert_equal "I have generated a beginner sequence with four elements made up of:", Player.new.play
  end

  def player_presses_q
    skip
  end

  def player_presses_i
    assert_equal "Here is how to play", Player.new.instructions
  end

  def player_make_an_incorrect_guess
    assert_equal "Please make a valid guess", Player.guess("rrgb")
  end

  def player_makes_a_guess_to_long
    assert_equal "Please make your guess four charterers. Only r g b or y", Player.guess("rgby")
  end

  def player_makes_a_guess_to_short
    assert_equal "Please make your guess four charterers. Only r g b or y", Player.guess("rgby")
  end

  def player_makes_a_valid_incorect_guess
    assert_equal "Good try...", Player.guess("rgby")
  end

  def player_makes_a_winning_guess
    assert_equal "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
            22 seconds.
            Do you want to (p)lay again or (q)uit?", Player.guess(GRRB)
  end



end

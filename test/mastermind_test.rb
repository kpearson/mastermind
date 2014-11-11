
require_relative '../lib/mastermind.rb'

class TestMastermind < Minitest::Test
  def setup
    @player = Player.new
  end

  def test_user_sees_welcome_message
    message = "Welcome to MASTERMIND! \n Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal message, @player.welcome_message
  end

  def test_player_presses_p
    assert_equal "I have generated a beginner sequence with four elements made up of:", @player.play_game
  end

  def test_player_presses_q
    skip
  end

  def test_player_presses_i
    assert_equal "Here is how to play", @player.instructions
  end

  def test_player_make_an_incorrect_guess
    assert_equal "Please make a valid guess", @player.guess("rrgb")
  end

  def test_player_makes_a_guess_to_long
    assert_equal "Please make your guess four charterers. Only r g b or y", @player.guess("rgby")
  end

  def test_player_makes_a_guess_to_short
    assert_equal "Please make your guess four charterers. Only r g b or y", @player.guess("rgby")
  end

  def test_player_makes_a_valid_incorect_guess
    assert_equal "Good try...", @player.guess("rgby")
  end

  def test_player_makes_a_winning_guess
    assert_equal "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
            22 seconds.
            Do you want to (p)lay again or (q)uit?", @player.guess("GRRB")
  end
end

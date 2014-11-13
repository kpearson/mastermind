require_relative './test_helper.rb'

class TestCli < Minitest::Test
  def setup
    @cli = Cli.new($stdin, $stdout)
    @game = Game.new($stdin, $stdout, 4)
  end

  def test_user_sees_welcome_message
    message = "Good bye"
    assert_equal message, @cli.call
  end

  def test_player_presses_p
    skip
    assert_equal "I have generated a beginner sequence with four elements made up of:", @player.play_game
  end

  def test_player_presses_q
    skip
  end

  def test_player_presses_i
    skip
    assert_equal "Here is how to play", @player.instructions
  end

  def test_player_make_an_incorrect_guess
    skip
    assert_equal "Please make a valid guess", @player.guess("rrgb")
  end

  def test_player_makes_a_guess_to_long
    skip
    assert_equal "Please make your guess four charterers. Only r g b or y", @player.guess("rgby")
  end

  def test_player_makes_a_guess_to_short
    skip
    assert_equal "Please make your guess four charterers. Only r g b or y", @player.guess("rgby")
  end

  def test_player_makes_a_valid_incorect_guess
    skip
    assert_equal "Good try...", @player.guess("rgby")
  end

  def test_player_makes_a_winning_guess
    skip
    assert_equal "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
            22 seconds.
            Do you want to (p)lay again or (q)uit?", @player.guess("GRRB")
  end
end

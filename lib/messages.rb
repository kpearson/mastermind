class Messages

  def welcome_message
    "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def command_prompt
    "> "
  end

  def new_game_prompt
    "I have generated a beginner sequence with four elements made up of:\n(r)ed,\
    (g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.\
    \nWhat's your guess?"
  end

  def win_game
    "Congratulations! You guessed correctly."
  end

  def to_long
    "You guess is to long.\nTry again."
  end

  def to_short
    "Your guess didn't have enough characters.\nTry again."
  end

  def invalid_chars
    "Your guess has one or more letters which are not part of the game.\nTry again."
  end

  def instructions
    "To play choose any combination of (r)ed, (g)reen, (b)lue or (y)ellow."
  end

  def close
    "Close! You have #{Game.correct_colors} in #{Game.correct_positions} correct positions."
  end
end
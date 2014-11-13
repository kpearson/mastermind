class Messages
  COLORS = ["(r)ed", "(g)reen", "(b)lue", "(y)ellow", "(p)urple", "(o)range"]
  def welcome_message
    "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def command_prompt
    "> "
  end

  def difficulty_message(difficulty)
    COLORS.take(difficulty).join(", ")
  end

  def new_game_message(difficulty)
    "I have generated a beginner sequence with four colors made up of:\n"\
    "#{difficulty_message(difficulty)}.\nUse (q)uit at any time to end the game.\n"\
    "What's your guess?"
  end

  def win_game
    "Congratulations! You guessed correctly."
  end

  def difficulty
    "What difficulty would you like?\n"
    "(e)asy, (m)edium, or (h)ard"
  end

  def to_long
    "You guess is to long.\n"\
    "Try again."
  end

  def to_short
    "Your guess didn't have enough characters.\nTry again."
  end

  def invalid_chars
    "The only colors are (r)ed, (g)reen, (b)lue or (y)ellow.\n"\
    "Try again."
  end

  def instructions
    "Instructions: To play choose any combination of (r)ed, (g)reen, (b)lue or (y)ellow.\n"\
    "What would you like to do?"
  end

  def main_menu
    "Main menu: Would you like to play again?\n"
    "(p)lay, (i)nstructions, or (q)uit"
  end

  def nearly(correct_colors, correct_positions)
    "Almost! You have #{correct_colors} #{correct_colors < 2 ? "color" : "colors"} correct and #{correct_positions}" \
    " #{correct_positions < 2 ? "is" : "are"} in the correct positions."
  end

  def good_bye
    "Thanks for playing."
  end
end
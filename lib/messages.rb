class Messages
  COLORS = ["(r)ed", "(g)reen", "(b)lue", "(y)ellow", "(p)urple", "(o)range"]

  attr_accessor :difficulty
  def initialize(difficulty)
    @difficulty = difficulty
  end

  def welcome_message
    "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def command_prompt
    "=> "
  end

  def difficulty_message
    COLORS.take(@difficulty).join(", ")
  end

  def new_game_message
    "I have generated a beginner sequence with four colors made up of:\n"\
    "#{difficulty_message}.\nUse (q)uit at any time to end the game.\n"\
    "What's your guess?"
  end

  def win_game
    "Congratulations! You guessed correctly."
  end

  def difficulty
    "What difficulty would you like?\n(e)asy, (m)edium, or (h)ard"
  end

  def to_long
    "You guess is to long.\n"\
    "Try again."
  end

  def to_short
    "Your guess didn't have enough characters.\n"\
    "Try again."
  end

  def invalid_chars
    "The only colors are #{difficulty_message}.\n"\
    "Try again."
  end

  def pre_instructions
    "Instructions: To play choose any combination of the provided colors.\n"\
    "What would you like to do: (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def in_instructions
    "Instructions: To play choose any combination of #{difficulty_message}.\n"\
    "What is your guess?"
  end

  def difficulty_instructions
    "difficulty is four colors is easy 5 colors is medium and 6 colors is hard"
  end

  def invalid_difficulty
    "Invalid selection. Please chose a difficulty."
  end

  def not_valid_input
    "Not a valid selection. Please choose (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def main_menu
    "Main menu:\n"\
    "(p)lay, (i)nstructions, or (q)uit"
  end

  def nearly(correct_colors, correct_positions)
    "Almost! You have #{correct_colors} #{correct_colors < 2 ? "color" : "colors"} correct and #{correct_positions}" \
    " #{correct_positions < 2 ? "is" : "are"} in the correct positions."
  end

  def good_bye
    "Good bye"
  end

  def duration(minuets, seconds)
    if minuets <= 0
      "It took you #{seconds} seconds."
    else
      "It took you #{minuets} minuets and #{seconds} seconds."
    end
  end

  def exit_game
    puts "Thank you playing."
    main_menu
  end
end
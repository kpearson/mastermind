class Player
  attr_reader :player
  def initialize
    @player = player
  end

  def welcome_message
    "Welcome to MASTERMIND"
  end

  def new_game_prompt
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

end
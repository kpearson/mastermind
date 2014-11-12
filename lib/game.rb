class Game
  attr_reader :instream, :outstream, :message, :guess
  def initialize(instream, outstream)
    @instream         = instream
    @outstream        = outstream
    @winning_sequence = "rgby".chars.shuffle
    @time_start       = Time.new
    @guesses          = 0
    @message          = Messages.new
    @guess            = ''
  end

  def play
    until win? || exit?
      outstream.puts message.new_game_message
      outstream.print message.command_prompt
      guessing
      prosses_guess
    end
  end

  def prosses_guess
    case
    when exit?
      outstream.puts message.quit_game
    when win?
      outstream.puts message.win_game
    when to_long?
      outstream.puts message.to_long
    when to_short?
      outstream.puts message.to_short
    when invalid_chars?
      outstream.puts message.invalid_chars
    when instructions?
      outstream.puts message.instructions
    when close?
      outstream.puts message.close(correct_colors, correct_positions)
      add_turn
    end
  end

  def guessing
    @guess = instream.gets.gsub(/\s+/, "").downcase
  end

  def guess_counter
    @guess_counter =+ 1
  end

  def exit?
    guess == "q" || guess == "quit"
  end

  def win?
    guess == @winning_sequence
  end

  def to_long?
    guess.chars.count >= 5
  end

  def to_short?
    guess.chars.count <= 3
  end

  def invalid_chars?
    /[^rgby]/ === "rgby"
  end

  def instructions?
    guess == "i"
  end

  def close?
    guess != win? && guess != to_short? && guess != to_long?
  end

  def correct_positions
    guess.chars.zip(@winning_sequence).count { |l| l[0] == l[1] }
  end

  def correct_colors
    guess.count(@winning_sequence.join)
  end

  def add_turn
    @guesses += 1
  end


end
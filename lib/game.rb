class Game
  attr_reader :instream, :outstream, :message
  def initialize(instream, outstream)
    @instream         = instream
    @outstream        = outstream
    @winning_sequence = "rgby".chars.shuffle
    @time_start       = Time.new
    @guess_counter    = 0
    @message          = Messages.new
    @guess            = nil
  end

  def play
    outstream.puts message.new_game_prompt
    guess
    until win? || exit?
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
      outstream.puts message.close
    end
  end

  def guess
    @guess ||= instream.gets.gsub(/\s+/, "").downcase
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
    guess = "i"
  end

  def close
    guess != win? && guess != to_short? && guess != to_long?
  end

  def self.correct_positions
    guess.chars.zip(@winning_sequence.chars).count { |l| l[0] == l[1] }
  end

  def self.correct_colors
    guess.count(@winning_sequence)
  end


end
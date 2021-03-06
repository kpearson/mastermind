require 'sequence_generator'
class Game
  attr_reader :instream, :outstream, :message, :guess, :difficulty
  def initialize(instream, outstream, difficulty)
    @instream         = instream
    @outstream        = outstream
    @difficulty       = difficulty
    @winning_sequence = SequenceGenerator.generate(difficulty)
    @time_start       = Time.new
    @guesses          = 0
    @message          = Messages.new(difficulty)
    @guess            = ''
  end

  def play
      @start_time = Time.now
      outstream.puts message.new_game_message
    until win? || exit?
      outstream.print message.command_prompt
      guessing
      process_guess
    end
  end

  def process_guess
    case
    when exit?
      raise Cli::Quit
    when win?
      duration = Time.diff(@start_time, Time.now)
      outstream.puts message.win_game
      outstream.puts message.duration(duration[:minute], duration[:second])
      outstream.puts message.main_menu
    when help?
      outstream.puts "#{@winning_sequence}"
    when instructions?
      outstream.puts message.in_instructions
    when to_long?
      outstream.puts message.to_long
    when to_short?
      outstream.puts message.to_short
    when invalid_chars?
      outstream.puts message.invalid_chars
    when nearly?
      outstream.puts message.nearly(correct_colors, correct_positions)
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
    guess == @winning_sequence.join
  end

  def help?
    guess == "h"
  end

  def to_long?
    guess.chars.count > difficulty
  end

  def to_short?
    guess.chars.count < difficulty
  end

  def invalid_chars?
    /[^rgby]/ === guess
  end

  def instructions?
    guess == "i"
  end

  def nearly?
    !win? && !invalid_guess?
  end

  def invalid_guess?
    to_short? && to_long? && invalid_chars?
  end

  def correct_positions
    guess.chars.zip(@winning_sequence).count { |l| l[0] == l[1] }
  end

  def correct_colors
    @winning_sequence.join.count(guess.chars.uniq.join)
  end

  def add_turn
    @guesses += 1
  end
end
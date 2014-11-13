require 'messages'
require 'game'
class Cli
  DIFFICULTY_MAP = {"e" => 4, "m" => 5, "h" => 6}

  class Quit < StandardError; end

  attr_reader :instream, :outstream, :message
  def initialize(instream, outstream)
    @command    = ""
    @message    = Messages.new(nil)
    @instream   = instream
    @outstream  = outstream
    @quit       = false
  end

  def call
    outstream.puts message.welcome_message
    outstream.print message.command_prompt
    @command = input
    while true
      command_prosesser
    end
  rescue Quit
    outstream.puts message.good_bye
  end

  def command_prosesser
    case
    when play?
      outstream.puts message.difficulty
      difficulty = input
      @difficulty = DIFFICULTY_MAP[difficulty]
      case
      when difficulty?
        game = Game.new(instream, outstream, @difficulty)
        game.play
      else
        outstream.puts message.invalid_difficulty
      end
    when instructions?
      outstream.puts message.pre_instructions
      @command = input
    else
      outstream.puts message.not_valid_input
    end
  end

  def play?
    @command == 'p' || @command == 'play'
  end

  def instructions?
    @command == 'i' || @command == "instructions"
  end

  def quit?
    @quit
  end

  def input
    input = instream.gets.chomp.downcase
    if input == 'q' || input == 'quit'
      raise Quit
    end
    input
  end

  def difficulty?
    DIFFICULTY_MAP.values.include?(@difficulty)
  end
end
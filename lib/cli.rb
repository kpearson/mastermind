require 'messages'
require 'game'
class Cli
  DIFFICULTY_MAP = {"e" => 4, "m" => 5, "h" => 6}

  attr_reader :instream, :outstream, :message

  def initialize(instream, outstream)
    @command    = ""
    @message   = Messages.new
    @instream   = instream
    @outstream  = outstream
  end

  def call
    outstream.puts message.welcome_message
    until finished?
      outstream.print message.command_prompt
      @command = instream.gets.strip
      command_prosesser
    end
  end

  def command_prosesser
    case
    when play?
      outstream.puts message.difficulty
      difficulty = instream.gets.chomp.downcase
      difficulty = DIFFICULTY_MAP[difficulty]
      game = Game.new(instream, outstream, difficulty)
      game.play
    when instructions?
      outstream.puts message.instructions
      @command = ''
    when finished?
      outstream.puts message.good_bye
    end
  end

  def play?
    @command == 'p'
  end

  def instructions?
    @command == 'i'
  end

  def finished?
    @command == 'q' || @command == 'quit'
  end
end
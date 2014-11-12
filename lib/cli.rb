require 'messages'
require 'game'
class Cli

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
      command_prosess
    end
  end

  def command_prosess
    case
    when play?
      game = Game.new(instream, outstream)
      game.play
    when instructions?
      outstream.puts message.instructions
      @command = ''
      command_prosess
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
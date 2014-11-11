require 'messages'
require 'game'
class Cli

  attr_reader :instream, :outstream, :messages

  def initialize(instream, outstream)
    @command    = ""
    @messages   = Messages.new
    @instream   = instream
    @outstream  = outstream
  end

  def call
    outstream.puts messages.welcome_message
    until finished?
      outstream.print messages.command_prompt
      @command = instream.gets.strip
      input_prosess
    end
  end

  def input_prosess
    case
    when play?
      game = Game.new(instream, outstream)
      game.play
    when instructions?
      outstream.puts messages.instructions
    when finished?
      outstream.puts messages.end_game
    else
      outstream.puts messages.invalid
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
class Player
  attr_reader :player
  def initialize
    @player = player
  end

  # def gets
  #   gets = gets.chomp
  # end

  def welcome_message
    puts "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    chouse_to_play
  end

  def chouse_to_play
    choice = gets.chomp
    if choice =="p"
      play_game
    elsif choice =='i' || choice =='instructions'
      instructions
    elsif choice =='q' || choice =='quit'
      return 'Good bye.'
    else
      puts "please choose from the available options."
      choice = nil
      chouse_to_play
    end
  end

  def instructions
    "Here is how to play"
  end

  def play_game
    @winning_list  = "rgby".chars.shuffle
    @guess_counter = s
    @time_start    = Time.now
    puts "I have generated a beginner sequence with four elements made up of:\"rgby\" \n
    What is your first guess?"
    loop do
      @guess = gets.chomp
      if @guess == @winning_list
        end_game
      else
        puts "Not quite. #{@guess.upcase} has #{@guess.count(@winning_list)} of the
        correct elements with #{count_positions} in the correct positions.\nYou've taken #{@guess_counter} guess.\n
        Try again"
      end
    end
  end

  def correct_positions
    @guess.chars.zip(@winning_list.chars).count { |l| l[0] == l[1] }
  end

  def end_game
    puts "Congratulations! You guessed the sequence #{@winning_list.upcase.each_char {|c| print c, ' ' }}
    in #{@guess_counter} guesses over #{@time_start-Time.now}."
    puts "Do you want to (p)lay again or (q)uit?"
  end
end
class SequenceGenerator

  def self.generate(difficulty)
    sequence = []                                     # => []
    colors   = %w(r g b y p o)                        # => ["r", "g", "b", "y", "p", "o"]
    selected_colors = colors.shift(difficulty)  # => ["r", "g", "b", "y", "p", "o"]
    difficulty.times do                         # => 6
      sequence << selected_colors.shuffle.sample      # => ["b"], ["b", "g"], ["b", "g", "o"], ["b", "g", "o", "g"], ["b", "g", "o", "g", "p"], ["b", "g", "o", "g", "p", "p"]
    end                                               # => 6
    sequence                                          # => ["b", "g", "o", "g", "p", "p"]
  end
end

# SequenceGenerator.generate("h")  # => ["b", "g", "o", "g", "p", "p"]

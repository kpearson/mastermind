class SequenceGenerator

  def self.generate(difficulty)
    sequence = []
    colors   = %w(r g b y p o)
    selected_colors = colors.shift(difficulty)
    difficulty.times do
      sequence << selected_colors.shuffle.sample
    end
    sequence
  end
end
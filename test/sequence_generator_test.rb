require_relative './test_helper.rb'

class SequenceGeneratorTest < Minitest::Test
  def test_it_generates_an_easy_sequence
    sequence = SequenceGenerator.generate(4)
    assert_equal 4, sequence.count
  end

  def test_it_generates_an_hard_sequence
    sequence = SequenceGenerator.generate(6)
    assert_equal 6, sequence.count
  end

  def test_it_generates_different_sequences
    sequence1 = SequenceGenerator.generate(6)
    sequence2 = SequenceGenerator.generate(6)
    refute_equal sequence1, sequence2
  end
end
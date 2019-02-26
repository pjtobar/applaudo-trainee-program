require 'minitest/autorun'
require_relative 'string_calculator'
class StringCalculatorTest < Minitest::Test
  def test_sum_two_numbers
    assert StringCalculator.add("2,4") == 6
  end

  def test_sum_two_numbers
    assert StringCalculator.add("17,100") == 117
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './password'

class PasswordTest < Minitest::Test
  def test_it_can_be_valid_by_frequency
    password = Password.new(["3-4", "l:", "flll"])
    assert password.valid_by_frequency?
  end

  def test_it_can_be_invalid_by_frequency
    password = Password.new(["4-5", "r:", "rrrhw"])
    refute password.valid_by_frequency?
  end

  def test_it_can_be_valid_by_position
    password = Password.new(["6-7", "t:", "lrmqtts"])
    assert password.valid_by_position?
  end

  def test_it_can_be_invalid_by_position
    password_1 = Password.new(["4-5", "r:", "rrrhw"])
    refute password_1.valid_by_position?

    password_2 = Password.new(["3-4", "l:", "flll"])
    refute password_2.valid_by_position?
  end
end

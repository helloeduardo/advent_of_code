require 'minitest/autorun'
require 'minitest/pride'
require './password'

class PasswordTest < Minitest::Test
  def test_it_can_be_valid
    password = Password.new(["3-4", "l:", "flll"])
    assert password.valid?
  end

  def test_it_can_be_invalid
    password = Password.new(["4-5", "r:", "rrrhw"])
    refute password.valid?
  end
end

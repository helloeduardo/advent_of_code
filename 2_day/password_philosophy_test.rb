require 'minitest/autorun'
require 'minitest/pride'
require './password_philosophy'
require './password'

class PasswordPhilosophyTest < Minitest::Test
  def setup
    data = File.readlines('input.txt', chomp: true).map(&:split)
    @password_philosophy = PasswordPhilosophy.new(data)
  end

  def test_it_exists
    assert_instance_of PasswordPhilosophy, @password_philosophy
  end

  def test_valid_count_by_frequency
    assert_equal 546, @password_philosophy.valid_count_by_frequency
  end

  def test_valid_count_by_position
    assert_equal 275, @password_philosophy.valid_count_by_position
  end
end

class Form
  attr_reader :responses

  def initialize(data)
    @responses = data.split
  end

  def yes_count_1
    unique_letters.count
  end

  def yes_count_2
    unique_letters.count do |letter|
      responses.join.count(letter) == responses.size
    end
  end

  def unique_letters
    responses.join.chars.uniq
  end
end

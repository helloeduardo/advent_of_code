class CustomCustoms
  attr_reader :forms

  def initialize(data)
    @forms = data.map do |form_data|
      Form.new(form_data)
    end
  end

  def yes_count_1
    forms.sum(&:yes_count_1)
  end

  def yes_count_2
    forms.sum(&:yes_count_2)
  end
end

class PasswordPhilosophy
  attr_reader :passwords

  def initialize(data)
    @passwords = data.map do |row_data|
      Password.new(row_data)
    end
  end

  def valid_count_by_frequency
    passwords.count(&:valid_by_frequency?)
  end

  def valid_count_by_position
    passwords.count(&:valid_by_position?)
  end
end

class PasswordPhilosophy
  attr_reader :passwords

  def initialize(data)
    @passwords = data.map do |row_data|
      Password.new(row_data)
    end
  end

  def valid_count
    passwords.count do |password|
      password.valid?
    end
  end
end

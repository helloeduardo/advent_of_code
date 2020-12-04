require "./passport"

class PassportProcessing
  attr_reader :passports

  def initialize(data)
    @passports = parse_data(data).map do |passport_data|
      Passport.new(passport_data)
    end
  end

  def parse_data(data)
    rows = data.chunk_while {|i,j| j != "" }.to_a.map { |e| e.join(' ') }.map(&:split)
    rows.map do |row|
      hash = {}
      row.map do |key_values|
        split = key_values.split(":")
        hash[split[0]] = split[1]
      end
      hash
    end
  end

  def count_valid_1
    passports.count(&:valid_1?)
  end

  def count_valid_2
    passports.count(&:valid_2?)
  end
end

data = File.readlines('input.txt', chomp: true)

solution_1 = PassportProcessing.new(data).count_valid_1
p solution_1
solution_2 = PassportProcessing.new(data).count_valid_2
p solution_2

# Array of Strings
data = File.readlines('input.txt', chomp: true)

class TobogganTrajectory
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def count_trees
    count = 0
    data.each.with_index do |row, index|
      if row[(3 * index) % row.size] == '#'
        count += 1
      end
    end
    count
  end
end

solution = TobogganTrajectory.new(data).count_trees
p solution

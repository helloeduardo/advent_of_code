class TobogganTrajectory
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def count_trees(right_shift, down_shift = 1)
    count = 0
    data.each_slice(down_shift).map(&:first).each.with_index do |row, index|
      if row[(right_shift * index) % row.size] == '#'
        count += 1
      end
    end
    count
  end

  def multiply_trees
    count_trees(1) *
    count_trees(3) *
    count_trees(5) *
    count_trees(7) *
    count_trees(1, 2)
  end
end

data = File.readlines('input.txt', chomp: true)

solution_1 = TobogganTrajectory.new(data).count_trees(3)
p solution_1

solution_2 = TobogganTrajectory.new(data).multiply_trees
p solution_2

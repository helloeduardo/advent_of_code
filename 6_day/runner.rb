require "./lib/custom_customs"
require "./lib/form"

data = File.read('data/input.txt', chomp: true).split("\n\n")

solution_1 = CustomCustoms.new(data).yes_count_1
p "Solution 1: #{solution_1}"

solution_2 = CustomCustoms.new(data).yes_count_2
p "Solution 2: #{solution_2}"

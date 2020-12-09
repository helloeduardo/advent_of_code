require "./lib/xmas"

example = File.readlines('data/example.txt', chomp: true).map(&:to_i)
input = File.readlines('data/input.txt', chomp: true).map(&:to_i)

example_1 = XMas.new(example, 5).first_invalid_sum
p "Example Solution 1: #{example_1}"

solution_1 = XMas.new(input, 25).first_invalid_sum
p "Solution 1: #{solution_1}"

example_2 = XMas.new(example, 5).encryption_weakness
p "Example Solution 2: #{example_2}"

solution_2 = XMas.new(input, 25).encryption_weakness
p "Solution 2: #{solution_2}"

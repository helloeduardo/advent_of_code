require "./lib/binary_boarding"
require "./lib/boarding_pass"

data = File.readlines('data/input.txt', chomp: true)

solution_1 = BinaryBoarding.new(data).highest_seat_id
p "Solution 1: #{solution_1}"

solution_2 = BinaryBoarding.new(data).my_seat_id
p "Solution 2: #{solution_2}"

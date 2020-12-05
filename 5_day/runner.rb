require "./binary_boarding"
require "./boarding_pass"

data = File.readlines('input.txt', chomp: true)

solution_1 = BinaryBoarding.new(data).highest_seat_id
p solution_1

solution_2 = BinaryBoarding.new(data).my_seat_id
p solution_2

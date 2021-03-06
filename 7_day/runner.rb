require "./lib/luggage_processor"
require "./lib/bag"

data = File.readlines('data/input.txt', chomp: true)

solution_1 = LuggageProcessor.new(data).count_of_bags_containing("shiny gold")
p "Solution 1: #{solution_1}" #233 using input

solution_2 = LuggageProcessor.new(data).count_of_bags_contained_in("shiny gold")
p "Solution 2: #{solution_2}" #421550 using input

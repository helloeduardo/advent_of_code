require "./lib/boot_code"
require "./lib/instruction"

data = File.readlines('data/input.txt', chomp: true)

boot_code = BootCode.new(data)

boot_code.run_instructions

solution_1 = boot_code.accumulator
p "Solution 1: #{solution_1}"

solution_2 = boot_code.accumulator_2
p "Solution 2: #{solution_2}

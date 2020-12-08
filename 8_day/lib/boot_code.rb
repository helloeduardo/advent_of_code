class BootCode
  attr_reader :instructions, :accumulator

  def initialize(instructions)
    @instructions = instructions.map do |instruction|
      Instruction.new(instruction)
    end
    @accumulator = 0
  end

  def run_instructions
    completed_instructions = []
    instruction = instructions.first

    until completed_instructions.include?(instruction)
      if instruction.operation == "acc"
        @accumulator += instruction.argument
        completed_instructions << instruction
        instruction = instructions[instructions.index(instruction) + 1]
      elsif instruction.operation == "jmp"
        completed_instructions << instruction
        instruction = instructions[instructions.index(instruction) + instruction.argument]
      else # nop - No Operation
        completed_instructions << instruction
        instruction = instructions[instructions.index(instruction) + 1]
      end
      break if instruction.nil? # needed for part 2 non-infinite solutions
    end
    instruction.nil? #will be true if reached the end
  end

  def run_instructions_2
    potential_corrupt_instructions = instructions.find_all do |instruction|
      instruction.operation == "jmp" || instruction.operation == "nop"
    end

    potential_corrupt_instructions.first.switch_operation

    until run_instructions
      potential_corrupt_instructions.first.switch_operation
      potential_corrupt_instructions.shift
      potential_corrupt_instructions.first.switch_operation
      @accumulator = 0
    end
  end
end

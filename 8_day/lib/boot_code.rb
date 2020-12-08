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
    end
  end

  def accumulator_2
  end
end

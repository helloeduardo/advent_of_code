class Instruction
  attr_reader :instruction, :operation, :argument

  def initialize(instruction)
    @instruction = instruction
    @operation = instruction.split[0]
    @argument = instruction.split[1].to_i
  end

  def switch_operation
    if operation == "jmp"
      @operation = "nop"
    elsif operation == "nop"
      @operation = "jmp"
    end
  end
end

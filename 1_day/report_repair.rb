class ReportRepair
  attr_reader :expenses

  def initialize(expenses)
    @expenses = expenses
  end

  def sum_to_2020(quantity)
    expenses.combination(quantity).to_a.find do |combo|
      combo.sum == 2020
    end
  end

  def product(quantity)
    sum_to_2020(quantity).reduce(:*)
  end
end

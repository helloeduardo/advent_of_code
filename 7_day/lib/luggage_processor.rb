class LuggageProcessor
  attr_reader :bags

  def initialize(bags)
    @bags = bags.map do |bag_rule|
      Bag.new(bag_rule)
    end
  end

  # def count_of_bags_containing(bag_color, bags_containing_color = [])
  #   # problem, counting muted yellow twice
  #   count = 0
  #   bags.each do |bag|
  #     if bag.contents.include?(bag_color)
  #       unless counted_bags.include?(bag_color)
  #         counted_bags << bag.color
  #         count += 1
  #         count += count_of_bags_containing(bag.color, counted_bags)
  #       end
  #     end
  #   end
  #   count
  # end

  def bags_containing(color, result = [])
    bags.each do |bag|
      if bag.contents.include?(color)
        # require "pry"; binding.pry
        bags_containing(bag.color, result)
      end
    end
    require "pry"; binding.pry
    result
  end

  def count_of_bags_containing(color)
    bags_containing(color).uniq.count
  end

end

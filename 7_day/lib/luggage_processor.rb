class LuggageProcessor
  attr_reader :bags

  def initialize(bags)
    @bags = bags.map do |bag_rule|
      Bag.new(bag_rule)
    end
  end

  def bags_containing(color, result = [])
    bags.each do |bag|
      if bag.contents.include?(color)
        result << bag.color unless result.include?(bag.color)
        bags_containing(bag.color, result)
      end
    end
    result
  end

  def count_of_bags_containing(color)
    bags_containing(color).count
  end

  def count_of_bags_contained_in(color)

  end
end

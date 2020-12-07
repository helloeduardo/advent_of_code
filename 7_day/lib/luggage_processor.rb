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
        result << bag.color
        result << bags_containing(bag.color, result)
      end
    end

    #rather than returning result, I have a nested results and need to disregard any nested arrays
    result.find_all do |element|
      element.is_a?(String)
    end
  end

  def count_of_bags_containing(color)
    # Need to call uniq due to inefficient algorithm
    bags_containing(color).uniq.count
  end

  def count_of_bags_contained_in(color)

  end
end

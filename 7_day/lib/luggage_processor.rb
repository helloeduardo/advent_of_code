class LuggageProcessor
  attr_reader :bags

  def initialize(bags)
    @bags = bags.map do |bag_rule|
      Bag.new(bag_rule)
    end
  end

  def bags_containing(color, result = [])
    bags.each do |bag|
      if bag.contents.keys.include?(color)
        result << bag.color unless result.include?(bag.color)
        bags_containing(bag.color, result)
      end
    end
    result
  end

  def count_of_bags_containing(color)
    bags_containing(color).count
  end

  def bags_contained_in(color, result = [])
    bags.each do |bag|
      if bag.color == color
        bag.contents.each do |color, quantity|
          quantity.times do
            result << color
            bags_contained_in(color, result)
          end
        end
      end
    end
    result
  end

  def count_of_bags_contained_in(color)
    bags_contained_in(color).count
  end
end

class Bag
  attr_reader :rule, :color, :contents

  def initialize(bag_rule)
    @rule = bag_rule
    @color = parse_color
    @contents = parse_contents
  end

  def parse_color
    rule.split[0..1].join(" ")
  end

  def parse_contents
    content = {}

    rule.split("contain ")[1].split(", ").map do |bag|
      content[bag.split[1..2].join(" ")] = bag.split[0].to_i
    end
    
    content
  end
end

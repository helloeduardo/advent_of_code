class Bag
  attr_reader :rule, :color, :contents

  def initialize(bag_rule)
    @rule = bag_rule
    @color = bag_rule.split[0..1].join(" ")
    @contents = parse_contents
  end

  def parse_contents
    rule.split("contain ")[1].gsub(/\d+\s/, "").split(", ").map do |bag|
      bag.split[0..1].join(" ")
    end
  end
end

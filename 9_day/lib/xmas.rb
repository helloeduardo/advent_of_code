class XMas
  attr_reader :data, :preamble_size, :invalid_number

  def initialize(data, preamble_size)
    @data = data
    @preamble_size = preamble_size
    @invalid_number = first_invalid_sum
  end

  def first_invalid_sum
    data.each.with_index do |number, index|
      next if index < preamble_size

      previous_numbers = data[index-preamble_size..index-1]

      potential_pairs = previous_numbers.combination(2).to_a

      valid_sums = potential_pairs.map(&:sum)

      if !valid_sums.include?(number)
        return number
      end
    end
  end

  def contiguous_set_summing_to_invalid_number
    set = nil
    size = 2
    while set.nil?
      set = data.each_cons(size).to_a.find do |sub_set|
        sub_set.sum == invalid_number
      end
      size += 1
    end
    set
  end

  def encryption_weakness
    set = contiguous_set_summing_to_invalid_number
    set.min + set.max
  end
end

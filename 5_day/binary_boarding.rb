class BinaryBoarding
  attr_reader :boarding_passes

  def initialize(data)
    @boarding_passes = data.map do |pass_data|
      BoardingPass.new(pass_data)
    end
  end

  def highest_seat_id
    boarding_passes.max_by(&:seat_id).seat_id
  end

  def my_seat_id
    seat_ids = boarding_passes.map(&:seat_id)
    seat_ids.find do |id|
      !seat_ids.include?(id + 1) && seat_ids.include?(id + 2)
    end
  end
end

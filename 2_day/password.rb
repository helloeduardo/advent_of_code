class Password
  def initialize(data)
    @min = data[0].split("-")[0].to_i
    @max = data[0].split("-")[1].to_i
    @letter = data[1][0]
    @passcode = data[2]
  end

  def valid_by_frequency?
    @passcode.count(@letter).between?(@min, @max)
  end

  def valid_by_position?
    (@passcode[@min - 1] == @letter) ^ (@passcode[@max - 1] == @letter)
  end
end

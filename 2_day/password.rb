class Password
  def initialize(data)
    @min = data[0].split("-")[0].to_i
    @max = data[0].split("-")[1].to_i
    @letter = data[1][0]
    @passcode = data[2]
  end

  def valid?
    @passcode.count(@letter).between?(@min, @max)
  end
end

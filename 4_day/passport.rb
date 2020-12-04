class Passport
  def initialize(data)
    @data = data
    @byr = data["byr"]
    @iyr = data["iyr"]
    @eyr = data["eyr"]
    @hgt = data["hgt"]
    @hcl = data["hcl"]
    @ecl = data["ecl"]
    @pid = data["pid"]
    @cid = data["cid"]
  end

  def valid_1?
    @data.count == 8 || ( @data.count == 7 && @cid.nil?)
  end

  def valid_2?
    valid_1? &&
    valid_byr? &&
    valid_iyr? &&
    valid_eyr? &&
    valid_hgt? &&
    valid_hcl? &&
    valid_ecl? &&
    valid_pid?
  end

  def valid_byr?
    @byr.to_i.between?(1920, 2002)
  end

  def valid_iyr?
    @iyr.to_i.between?(2010, 2020)
  end

  def valid_eyr?
    @eyr.to_i.between?(2020, 2030)
  end

  def valid_hgt?
    if @hgt.end_with?("in")
      @hgt.to_i.between?(59, 76)
    elsif @hgt.end_with?("cm")
      @hgt.to_i.between?(150, 193)
    else
      false
    end
  end

  def valid_hcl?
    @hcl.size == 7 && @hcl.start_with?('#')
  end

  def valid_ecl?
    colors = %w(amb blu brn gry grn hzl oth)
    colors.include?(@ecl)
  end

  def valid_pid?
    @pid.size == 9
  end
end

class BoardingPass
  attr_reader :row_binary, :column_binary

  def initialize(data)
    @row_binary = data[0..6]
    @column_binary = data[7..9]
  end

  def row
    rows = (0..127).to_a
    row_binary.each_char do |chr|
      rows = rows.each_slice(rows.size/2).to_a
      if chr == "F"
        rows = rows.first
      else
        rows = rows.last
      end
    end
    rows.first
  end

  def column
    columns = (0..7).to_a
    column_binary.each_char do |chr|
      columns = columns.each_slice(columns.size/2).to_a
      if chr == "L"
        columns = columns.first
      else
        columns = columns.last
      end
    end
    columns.first
  end

  def seat_id
    row * 8 + column
  end
end

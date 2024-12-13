class DataTable
  def initialize(data)
    self.data = data
  end

  def get_element(num_of_row, num_of_column)
    @data[num_of_row][num_of_column]
  end

  def row_count
    @data.size
  end

  def col_count
    @data.empty? ? 0 : @data[0].size
  end

  def to_s
    @data.inspect
  end

  private

  attr_reader :data

  def data=(data)
    validate_data(data)
    @data = deep_dup(data)
  end

  def validate_data(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, "Данные должны быть в виде двумерного массива"
    end
  end

  def deep_dup(element)
    if element.is_a?(Array)
      element.map { |sub_element| deep_dup(sub_element) }
    else
      element.dup rescue element
    end
  end
end

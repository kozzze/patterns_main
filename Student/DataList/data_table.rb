class DataTable
  def initialize(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, "Data must be a two-dimensional array"
    end
    @data = data
  end

  private

  def data
    @data
  end
end
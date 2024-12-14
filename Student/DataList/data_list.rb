class DataList
  def initialize(data, column_name = [])
    self.data = data
    @column_name = column_name
    @selected = []
  end

  def select(number)
    element = @data[number]
    if element && !@selected.include?(element.id)
      @selected << element.id
    end
  end

  def get_selected
    @selected.dup
  end

  def get_names
    raise NotImplementedError, "Метод не реализован в классе DataList"
  end

  def get_data
    raise NotImplementedError, "Метод не реализован в классе DataList"
  end

  private

  attr_reader :data
  attr_accessor :selected

  def data=(data)
    raise ArgumentError, "Данные должны быть массивом" unless data.is_a?(Array)
    @data = data.map { |element| deep_dup(element) }
  end

  def deep_dup(element)
    return nil if element.nil?

    if element.is_a?(Array)
      element.map { |sub_element| deep_dup(sub_element) }
    else
      element.dup rescue element
    end
  end
end

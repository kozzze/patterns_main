class DataList
  def initialize(elements)
    self.data = elements
  end

  private

  attr_reader :data

  def data=(data)
    validate_elements(data)
    @data = deep_dup(data)
  end

  def deep_dup(element)
    if element.is_a?(Array)
      element.map { |sub_element| deep_dup(sub_element) }
    else
      element.dup rescue element
    end
  end

    def validate_elements(elements)
      unless elements.is_a?(Array)
        raise ArgumentError, "Элементы должны быть Array"
      end
    end    
  end

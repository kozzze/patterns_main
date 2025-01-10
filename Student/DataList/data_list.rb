class DataList
    def initialize(data)
      self.data = data
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
  
    def get_data
      data = get_objects_array
      DataTable.new(data)
    end
  
    protected
  
    attr_reader :data
    attr_accessor :selected
  
    def data=(new_data)
      raise ArgumentError, "Данные должны быть массивом" unless new_data.is_a?(Array)
      @data = new_data.map { |element| deep_dup(element) }
    end

    def get_objects_array
		raise NotImplementedError, "Метод не реализован в классе"
	  end

  def get_names
    raise NotImplementedError, "Метод не реализован в классе"
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
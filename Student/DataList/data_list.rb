class DataList
    def initialize(data, column_name = [])
      self.data = data
      @column_name = column_name.freeze
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
        column_names
    end
  
    def get_data
        get_objects_array
    end
  
    protected
  
    attr_reader :data
    attr_accessor :selected
  
    def data=(new_data)
      raise ArgumentError, "Данные должны быть массивом" unless new_data.is_a?(Array)
      @data = new_data.map { |element| deep_dup(element) }
    end
    
    def column_names=(names)
    	raise ArgumentError, "Наименования столбцов не могут быть изменены" unless @column_names.nil?
  	end

    def column_names
		raise NotImplementedError, "Метод не реализован в классе"
	end

    def get_objects_array
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
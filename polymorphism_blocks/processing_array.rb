#6,18,30,31,19,7

class ArrayProcessing

  attr_reader :array

  def initialize(array)
    self.array = array
  end

  def array=(array)
    if array.is_a? (Array)
      @array = array
    else
      raise TypeError.new('Входные данные неверны')
    
    end
  end

  # Метод detect
  def detect
    array.each do |element|
      return element if yield(element)
    end
    nil
  end

  # Метод map
  def map
    res = []
    array.each do |element|
      res << yield(element)
    end
    res
  end

end

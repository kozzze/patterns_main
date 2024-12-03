# encoding: utf-8
class ArrayProcessing
  def initialize(array)
    self.array = array
  end

  def array=(array)
    if array.is_a?(Array)
      @array = array
    else
      raise TypeError.new('Входные данные неверны')
    end
  end

  def detect
    @array.each do |element|
      return element if yield(element)
    end
    nil
  end

  def map
    res = []
    @array.each do |element|
      res << yield(element)
    end
    res
  end

  def select
    res = []
    @array.each do |element|
      res << element if yield(element)
    end
    res
  end

  def sort
    sorted_array = @array.dup 
    for i in 0...sorted_array.length do
      for j in 0...(sorted_array.length - i - 1) do
      if block_given?
        comparison = yield(sorted_array[j], sorted_array[j + 1])
      else
        comparison = sorted_array[j] <=> sorted_array[j + 1]
      end
      if comparison > 0
        temp = sorted_array[j]
        sorted_array[j] = sorted_array[j + 1]
        sorted_array[j + 1] = temp
      end
      end
    end
    sorted_array
    end

  def max
    return nil if @array.empty?
  
    max_el = @array[0]
    @array.each do |element|
      comp = block_given? ? yield(max_el, element) : (max_el <=> element)
      max_el = element if comp == -1
    end
    max_el
  end

  def drop_while
    result = []
    skip = true
    @array.each do |element|
      if skip && yield(element)
        next
      else
        skip = false
        result << element
      end
    end
    result
  end
end




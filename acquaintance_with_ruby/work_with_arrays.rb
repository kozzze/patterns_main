# Минимальный элемент массива
def min_array(array)
  min = array[0]
  for i in 1...(array.length)
    if array[i] < min
      min = array[i]
    end
  end
  return min
end

array = [1,-4,2,-5,4,6,8,9]
puts "Минимальный элемент массива = #{min_array(array)}"
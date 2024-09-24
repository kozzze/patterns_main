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

# Нахождение первого положительного элемента в массиве
def positiv_numb(array)
  i = 0
  while i < array.length
    if array[i] > 0
      return i  # Индекс первого положительного элемента
    end
    i += 1
  end
  return -1  # Если положительных элементов нет
end

array = [1,-4,2,-5,4,6,8,9]
puts "Минимальный элемент массива = #{min_array(array)}"
puts "Первый положительный элемент находся под индексом - #{positiv_numb(array)}"
# Циклический сдвиг элементов массива влево на три позиции.
def shift_left(arr)
  arr.rotate(3)
end

#Hайти элементы, расположенные перед первым минимальным
def find_before_min(arr)
  arr[0...arr.index(arr.min)]
end
#Необходимо определить является ли элемент по указанному индексу локальным максимумом. (Число меньше длинны массива)
def local_max?(arr,ind)
   if ind > 0 && ind < arr.length && arr[ind] > arr[ind-1] && arr[ind] > arr[ind+1]
    true
  end
  false
end 

# Найти все элементы, которые меньше среднего арифметического элементов массива
def el_less_am(arr)
  return "Массив пуст" if arr.empty? 
  am =  arr.sum.to_f / arr.length
  arr.select {|n| n < am} 
end  
arr=[1,2,3,4,5,6,7,8,9,10]
puts el_less_am(arr)
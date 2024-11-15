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

arr=[1,3,3,3,4,1,5]
n=3
puts local_max?(arr,n)
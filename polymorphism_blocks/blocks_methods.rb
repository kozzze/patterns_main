# Циклический сдвиг элементов массива влево на три позиции.
def shift_left(arr)
  arr.rotate(3)
end

#Hайти элементы, расположенные перед первым минимальным
def find_before_min(arr)
  arr[0...arr.index(arr.min)]
end


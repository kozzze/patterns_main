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
    return true
  end
  return false
end 

# Найти все элементы, которые меньше среднего арифметического элементов массива
def el_less_am(arr)
  return "Массив пуст" if arr.empty? 
  am =  arr.sum.to_f / arr.length
  arr.select {|n| n < am} 
end  
# Найти элементы встречающиеся более 3 раз
def el_more_three(arr)
  arr.select{|el| arr.count(el)>3}.uniq
end

# Метод для ввода массива
def input_array
	puts "Введите массив целых чисел (через пробел):"
	gets.chomp.split.map(&:to_i)
end

puts "\nВыберте метод (1-5)"
puts "1. Циклический сдвиг влево"
puts "2. Вывести элементы перед первым минимальным"
puts "3. Локальный максимум?"
puts "4. Элементы меньше ср. арифметического"
puts "5. Элементы которых больше трёх"

choice = gets.to_i

case choice
when 1
  arr = input_array
  puts "Массив сдвинут на 3 позиции влево: #{shift_left(arr)}"
when 2
  arr = input_array
  puts "Элементы расположенные перед минимальным: #{find_before_min(arr)}"
when 3
  arr = input_array
  puts "Введите индекс для проверки: "
  ind = gets.to_i
  puts local_max?(arr,ind)
when 4
  arr = input_array
  puts "Элементы меньшие среднего арифметического: #{el_less_am(arr)}"
when 5
  arr = input_array
  puts "Элементы которых больше трёх: #{el_more_three(arr)}"
else 
  puts "Неверный выбор"
end
  
  
    
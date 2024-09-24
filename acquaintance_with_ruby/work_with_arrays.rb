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

# Функция для чтения массива из файла
def read(path)
  begin
    file = File.open(path, "r")
    ar = file.read.split.map(&:to_i)
    file.close
    ar
  rescue => e
    puts "Ошибка при чтении файла: #{e.message}"
    []
  end
end

if ARGV.size == 2
  method = ARGV[0].to_i
  file = ARGV[1]
  array = read(file)

  if array.empty?
    puts "Массив пустой, проверьте файл."
    exit
  end

  puts "Массив: [#{array.join(', ')}]"

  if method == 1
    puts "Минимальное значение в массиве: #{min_array(array)}"
  elsif method == 2
    ind = positiv_numb(array)
    if ind == -1
      puts "Положительных элементов в массиве нет."
    else
      puts "Первое положительное значение находится под индексом #{ind} - (для программистов); #{ind + 1} - (для обычных людей)"
    end
  else
    puts "Неизвестный метод. Пожалуйста, выберите 1 или 2"
  end
else
  puts "Введите два аргумента: метод и путь к файлу."
end

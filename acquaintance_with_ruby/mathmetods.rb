#Метод для нахождения суммы непростых делитей числа
def sum_of_non_prime_divisors(number)
  # Функция для проверки, является ли число простым
  def prime?(num)
    return false if num <= 1
    (2..Math.sqrt(num)).none? { |i| num % i == 0 }
  end

  # Находим все делители числа
  divisors = (1..number).select { |i| number % i == 0 }

  # Фильтруем только непростые делители и находим их сумму
  non_prime_divisors = divisors.reject { |d| prime?(d) }
  non_prime_divisors.sum
end

puts "Введите число для метода 1: "
numb = $stdin.gets.chomp.to_i
puts "Сумма непростых делитей равна #{sum_of_non_prime_divisors(numb)}"

#Метод для нахождения количества цифр меньших 3

def count_digits_less_than_3(number)
  # Преобразуем число в строку и затем в массив символов
  digits = number.to_s.chars

  # Подсчитываем количество цифр, меньших 3
  digits.count { |digit| digit.to_i < 3 }
end

puts "Введите число для метода 2: "
numb2 = $stdin.gets.chomp.to_i # Преобразуем введенное значение в целое число

count = count_digits_less_than_3(numb2)
puts "Количество цифр, меньших 3: #{count}"
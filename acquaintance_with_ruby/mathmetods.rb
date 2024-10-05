# Метод для нахождения суммы непростых делителей числа
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
puts "Сумма непростых делителей равна #{sum_of_non_prime_divisors(numb)}"

# Метод для нахождения количества цифр, меньших 3
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

# Метод для нахождения количества чисел, не являющихся делителями исходного числа,
# не взаимнопростых с ним и взаимнопростых с суммой простых цифр этого числа.
def calculate_special_count(n)
  # Функция для нахождения НОД (алгоритм Евклида)
  def gcd(a, b)
    while b != 0
      a, b = b, a % b
    end
    a
  end

  # Проверка, является ли цифра простой
  def prime_digit?(digit)
    [2, 3, 5, 7].include?(digit)
  end

  # Нахождение суммы простых цифр числа
  def sum_of_prime_digits(n)
    sum = 0
    while n > 0
      digit = n % 10
      sum += digit if prime_digit?(digit)
      n /= 10
    end
    sum
  end

  # Основной блок вычисления
  prime_digit_sum = sum_of_prime_digits(n)
  count = 0
  valid_numbers = []  # Массив для хранения чисел, удовлетворяющих условиям

  # Проход по всем числам от 1 до n - 1
  (1...n).each do |i|
    if n % i != 0 && gcd(i, n) != 1 && gcd(i, prime_digit_sum) == 1
      count += 1
      valid_numbers << i  # Добавляем подходящее число в массив
    end
  end

  # Возвращаем количество таких чисел и сами числа
  [count, valid_numbers]
end

puts "Введите число для метода 3:"
numb3 = gets.chomp.to_i
result = calculate_special_count(numb3)
count, valid_numbers = result

puts "Количество чисел: #{count}"
puts "Подходящие числа: #{valid_numbers.join(', ')}"
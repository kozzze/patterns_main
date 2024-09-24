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

#Создаем класс Student
class Student
  #Геттеры обязательные поля
  attr_reader :id, :lastname, :firstname, :surname
  #Сеттеры не обязательные поля
  attr_accessor :phone, :telegram, :email, :github

  def initialize(id:, lastname:, firstname:, surname:, phone:nil, telegram:nil, email:nil, github:nil)
    @id=id
    @lastname=lastname
    @firstname=firstname
    @surname=surname
    @phone=phone
    @telegram=telegram
    @email=email
    @github=github
  end
  def to_s
    "ID: #{@id}, ФИО: #{@lastname} #{@firstname} #{@surname}, Номер телефона: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, GitHub: #{@github}"
  end
  #Метод для вывода на экран сведений о студенте
  def display_info
    puts "Сведения о студенте:"
    puts "ID: #{@id}"
    puts "Фамилия: #{@lastname}"
    puts "Имя: #{@firstname}"
    puts "Отчество : #{@surname}"
    puts "Телеграм: #{@telegram}"
    puts "Почта: #{@email}"
    puts "GitHub: #{@github}"
    puts "\n"

  end
end

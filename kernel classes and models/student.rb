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
    if phone && !self.class.phone_valid?(phone)
      raise ArgumentError, "Номер введен неверно: #{phone}"
    end
    @phone=phone
    @telegram=telegram
    @email=email
    @github=github
  end
  def to_s
    "ID: #{@id}, ФИО: #{@lastname} #{@firstname} #{@surname}, Номер телефона: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, GitHub: #{@github}"
  end
  #Метод для валидации телефона
  def self.phone_valid?(phone)
    return false if phone.nil? || phone.empty?
    phone =~ /^\+?\d{10,15}$/
  end

  #Метод для вывода на экран сведений о студенте
  def display_info
    puts "Сведения о студенте:"
    puts "ID: #{@id}"
    puts "Фамилия: #{@lastname}"
    puts "Имя: #{@firstname}"
    puts "Отчество : #{@surname}"
    puts "Телефон : #{@phone}" if @phone
    puts "Телеграм: #{@telegram}" if @telegram
    puts "Почта: #{@email}" if @email
    puts "GitHub: #{@github}" if @github
    puts "\n"

  end
end

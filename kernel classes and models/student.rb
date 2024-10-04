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
end

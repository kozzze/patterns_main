require 'date'
require_relative 'person'

#Создаем класс Student
class Student < Person

  include Comparable

  #Геттер
  attr_reader :phone, :telegram, :email, :firstname, :lastname, :surname, :birth_date

  def initialize(lastname:, firstname:, surname:,id:nil, birth_date:nil, phone:nil, telegram:nil, email:nil, github:nil)
    #Конструктор суперкласса
    super(id: id, github: github)
    
    self.firstname = firstname
    self.lastname = lastname
    self.surname = surname
    self.birth_date = birth_date
    set_contacts(phone: phone, telegram: telegram, email: email)
    
  end

  def birth_date=(value)
    if value.nil? || value.strip.empty?
      @birth_date = nil # Если дата не указана, оставляем nil
    elsif Student.valid_birth?(value)
      @birth_date = Date.strptime(value, '%Y-%m-%d') # Преобразование в объект Date
    else
      raise ArgumentError, "Дата рождения введена неверно: #{value}"
    end
  end

  def firstname=(firstname)
    if Student.name_valid?(firstname)
      @firstname = firstname
    else
      raise ArgumentError, "Имя введено неверно: #{firstname}"
    end
  end 
  def lastname=(lastname)
    if Student.name_valid?(lastname)
      @lastname = lastname
    else
      raise ArgumentError, "Фамилия введена неверно: #{lastname}"
    end
  end 
  def surname=(surname)
    if Student.name_valid?(surname)
      @surname = surname
    else
      raise ArgumentError, "Отчество введено неверно: #{surname}"
    end
  end 

  def github=(github)
    if Student.valid_github?(github)
      @github = github
    else
      raise ArgumentError, "GitHub введен неверно: #{github}"
    end
  end 
    
  def self.valid_birth?(date)
    return false if date.nil? || date.strip.empty?

    begin
      Date.strptime(date, '%Y-%m-%d')
      true
    rescue ArgumentError
      false
    end
  end

  


  def to_s
    "ID: #{@id}, ФИО: #{@lastname} #{@firstname} #{@surname}, Дата рождения: #{@birth_date}, Номер телефона: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, GitHub: #{@github}"
  end

  def <=>(other)
    return nil unless other.is_a?(Student)
    birth_date <=> other.birth_date
  end

  # Метод для установки значений полей контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    if phone &&!Student.phone_valid?(phone)
      raise ArgumentError, "Номер введен неверно: #{phone}"
    else
      @phone = phone
    end
    if telegram &&!Student.tg_valid?(telegram)
      raise ArgumentError, "Телеграм введен неверно: #{telegram}"
    else
      @telegram = telegram
    end
    if email && !Student.mail_valid?(email)
      raise ArgumentError, "Email введен неверно: #{email}"
    else
      @email = email
    end
  end

  def contact
    contact_info = []
    contact_info << "Телефон: #{phone}" if phone
    contact_info << "Telegram: #{telegram}" if telegram
    contact_info << "Email: #{email}" if email
    contact_info.join(' ; ')
  end

  def initials
    "#{lastname} #{firstname[0]}. #{surname[0]}."
  end
  def get_info
    info=[]
    info.push("ФИО: #{@lastname} #{firstname[0]}.#{@surname[0]}.")
    info.push("Git: #{@github}") if github
    info.push ("Номер: #{@phone}") if phone
    info.push ("Telegram: #{@telegram}") if telegram
    info.push ("Email: #{@email}") if email
    info.join(" ; ")
  end
  
  
end

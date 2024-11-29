
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

  def birth_date=(birth_date)
    if birth_date.nil? || valid_birth?(birth_date)
      @birth_date = birth_date
    else
      raise ArgumentError, "Дата неверна:#{birth_date}"
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
    
  def valid_birth?(date)
    date.match?(/^(0[1-9]|[12][0-9]|3[01])\-(0[1-9]|1[0-2])\-(19|20)\d{2}$/)
  end
  


  def to_s
    "ID: #{@id}, ФИО: #{@lastname} #{@firstname} #{@surname}, Дата рождения: #{@birth_date}, Номер телефона: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, GitHub: #{@github}"
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
  
  def <=>(other)
    day1, month1, year1 = @birth_date.split('-').map(&:to_i)
    day2, month2, year2 = other.birth_date.split('-').map(&:to_i)
    [year1, month1, day1] <=> [year2, month2, day2]
  end
end

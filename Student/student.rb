require_relative 'person'

#Создаем класс Student
class Student < Person

  #Геттер
  attr_reader :phone, :telegram, :email, :firstname, :lastname, :surname

  def initialize(lastname:, firstname:, surname:,id:nil, phone:nil, telegram:nil, email:nil, github:nil)
    #Конструктор суперкласса
    super(id: id, github: github)
    
    self.firstname = firstname
    self.lastname = lastname
    self.surname = surname
    set_contacts(phone: phone, telegram: telegram, email: email)
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
  


  def to_s
    "ID: #{@id}, ФИО: #{@lastname} #{@firstname} #{@surname}, Номер телефона: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, GitHub: #{@github}"
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

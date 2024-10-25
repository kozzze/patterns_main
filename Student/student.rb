require_relative 'person'

#Создаем класс Student
class Student < Person

  #Геттер
  attr_reader :phone, :telegram, :email, :firstname, :lastname, :surname

  def initialize(id:nil, lastname:, firstname:, surname:, phone:nil, telegram:nil, email:nil, github:nil)
    #Конструктор суперкласса
    super(id: id, github: github)
    
    self.firstname = firstname
    self.lastname = lastname
    self.surname = surname
    set_contacts(phone: phone, telegram: telegram, email: email)
  end

  def firstname=(firstname)
    if self.class.name_valid?(firstname)
      @firstname = firstname
    else
      raise ArgumentError, "Имя введено неверно: #{firstname}"
    end
  end 
  def lastname=(lastname)
    if self.class.name_valid?(lastname)
      @lastname = lastname
    else
      raise ArgumentError, "Фамилия введена неверно: #{lastname}"
    end
  end 
  def surname=(surname)
    if self.class.name_valid?(surname)
      @surname = surname
    else
      raise ArgumentError, "Отчество введено неверно: #{surname}"
    end
  end 

  


  def to_s
    "ID: #{@id}, ФИО: #{@lastname} #{@firstname} #{@surname}, Номер телефона: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, GitHub: #{@github}"
  end

  #Метод для валидации телефона
  def self.phone_valid?(phone)
    return false if phone.nil? || phone.empty?
    phone =~ /^\+?\d{10,15}$/
  end

  # Валидация имени
  def self.name_valid?(name)
    name && name=~/^[A-Za-zА-Яа-яЁё\s-]+$/
  end

  # Валидация почты
  def self.mail_valid?(mail)
     mail =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  end

  # Валидация телеграмма
  def self.tg_valid?(tg)
    tg =~ /^@[A-Za-z0-9_]{1,32}$/
  end

  # Метод для проверки существования контакта и гита
  def validate
    github_present? && contact_present?
  end

  # Методы для проверки наличия контактов и гита
  def contact_present?
    !@phone.nil? || !@telegram.nil? || !@email.nil?
  end
  def github_present?
    !@github.nil? && !@github.empty?
  end

  # Метод для установки значений полей контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    if phone &&!self.class.phone_valid?(phone)
      raise ArgumentError, "Номер введен неверно: #{phone}"
    else
      @phone = phone
    end
    if telegram &&!self.class.tg_valid?(telegram)
      raise ArgumentError, "Телеграм введен неверно: #{telegram}"
    else
      @telegram = telegram
    end
    if email && !self.class.mail_valid?(email)
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
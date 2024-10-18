#Создаем класс Student
class Student

  attr_accessor :lastname, :firstname, :surname, :github
 
  attr_reader :id,:phone, :telegram, :email

  def initialize(id:nil, lastname:, firstname:, surname:, phone:nil, telegram:nil, email:nil, github:nil)
    @id=id
    self.lastname=lastname
    self.firstname=firstname
    self.surname=surname
    self.github = github if github
    set_contacts(phone: phone, telegram: telegram, email: email)
  end

  def github=(github)
    if self.class.valid_github?(github)
      @github = github
    else
      raise ArgumentError, "GitHub введен неверно: #{github}"
    end
  end 

  def lastname=(lastname)
    if self.class.name_valid?(lastname)
      @lastname = lastname
    else
      raise ArgumentError, "Фамилия введена неверно: #{lastname}"
    end
  end

  def firstname=(firstname)
    if self.class.name_valid?(firstname)
      @firstname = firstname
    else
      raise ArgumentError, "Имя введено неверно: #{firstname}"
    end
  end

  def surname=(surname)
    if self.class.name_valid?(surname)
      @surname = surname
    else
      raise ArgumentError, "Отчество введено неверно: #{@surname}"
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

  # Валидация GitHub
  def self.valid_github?(github)
     github=~/^(https?:\/\/)?(www\.)?github\.com\/[A-Za-z0-9._-]+$/
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
    unless contact_present?
      raise ArgumentError, "Надо указать хотя бы один контакт. "
    end
    unless github_present?
      raise ArgumentError, "Надо указать GitHub"
    end
  end

  # Методы для проверки наличия контактов и гита
  def contact_present?
    !@phone.nil? || !@telegram.nil? || !@email.nil?
  end
  def github_present?
    !@github.nil? && !github.empty?
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

  # Метод для вывода на экран сведений о студенте
  def display_info
    str=[]
    str.push( "ID: #{@id}")
    str.push( "Фамилия: #{@lastname}")
    str.push( "Имя: #{@firstname}")
    str.push( "Отчество : #{@surname}")
    str.push( "Телефон : #{@phone}") if @phone
    str.push( "Телеграм: #{@telegram}") if @telegram
    str.push( "Почта: #{@email}") if @email
    str.push( "GitHub: #{@github}") if @github
    str.join(" ")
  end
end

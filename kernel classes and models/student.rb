

#Создаем класс Student
class Student

  #Геттер
  attr_reader :id,:phone, :telegram, :email,:lastname, :firstname, :surname, :github

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
class Student_short 
  attr_reader :id, :initials, :github, :contact
  
  def initialize(*args)
    if args[0].is_a?(Student)
      student = args[0]
      @id = student.id
      @initials = "#{student.lastname} #{student.firstname[0]}. #{student.surname[0]}."
      @github = student.github
      @contact = format_contact(student)
    elsif args.length == 2 
      @id = args[0]
      parts = args[1].split(';')
      @initials = parts[0].strip
      @github = parts[1]&.strip 
      @contact = parts[2..-1].map(&:strip).join('; ') if parts[2]
    else
      raise ArgumentError, "Неправильное количество аргументов"
    end
  end

  private
  
  def format_contact(student)
    contact_info = []
    contact_info << "Телефон: #{student.phone}" if student.phone
    contact_info << "Telegram: #{student.telegram}" if student.telegram
    contact_info << "Email: #{student.email}" if student.email
    contact_info.join(' ; ')
  end

  public

  def to_s
    "ID: #{@id}, ФИО: #{@initials}, GitHub: #{@github}, Контакты: #{@contact}"
  end





end
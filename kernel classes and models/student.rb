#Создаем класс Student
class Student
  #Геттеры обязательные поля
  attr_reader :id, :lastname, :firstname, :surname
  #Геттеры для контактов
  attr_reader :phone, :telegram, :email, :github

  def initialize(id:, lastname:, firstname:, surname:, phone:nil, telegram:nil, email:nil, github:nil)
    @id=id
    @lastname=lastname
    @firstname=firstname
    @surname=surname
    raise ArgumentError, "Фамилия введена неверно:  #{@lastname}" unless self.class.name_valid?(@lastname)
    raise ArgumentError, "Имя введена неверно:  #{@firstname}" unless self.class.name_valid?(@firstname)
    raise ArgumentError, "Отчетво введена неверно:  #{@surname}" unless self.class.name_valid?(@surname)
    @github = github
    if github && !self.class.valid_github?(github)
      raise ArgumentError, "GitHub введен неверно: #{github}"
    end
    set_contacts(phone: phone, telegram: telegram, email: email)
    validate
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
    github && github=~/^(https?:\/\/)?(www\.)?github\.com\/[A-Za-z0-9._-]+$/
  end

  # Валидация почты
  def self.mail_valid?(mail)
    mail && mail =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  end

  # Валидация телеграмма
  def self.tg_valid?(tg)
    tg && tg =~ /^@[A-Za-z0-9_]{1,32}$/
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
    if phone && !self.class.phone_valid?(phone)
      raise ArgumentError, "Номер введен неверно: #{phone}"
    end
    if telegram && !self.class.tg_valid?(telegram)
      raise ArgumentError, "Телеграм введен неверно: #{telegram}"
    end
    if email && !self.class.mail_valid?(email)
      raise ArgumentError, "Email введен неверно: #{email}"
    end

    # Устанавливаем значения контактов
    @phone = phone if phone
    @telegram = telegram if telegram
    @email = email if email
  end

  # Метод для вывода на экран сведений о студенте
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

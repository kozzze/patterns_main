class Person

  attr_reader :id, :github
  
  def initialize(id: nil,github: nil)
    @id = id if id
    @github = github if github
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
def validate?
  github_present? && contact_present?
end

# Методы для проверки наличия контактов и гита
def contact_present?
  !@phone.nil? || !@telegram.nil? || !@email.nil?
end
def github_present?
  !@github.nil? && !@github.empty?
end

  #Валижация для git
  def self.valid_github?(github)
    github=~/^(https?:\/\/)?(www\.)?github\.com\/[A-Za-z0-9._-]+$/
 end
   




end 
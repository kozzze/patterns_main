require_relative 'student'
class Student_short < Person

  attr_reader :github, :contact
  
  def initialize(student)
    #Конструктор суперкласса
    super(id: student.id, lastname: student.lastname, firstname: student.firstname, surname: student.surname)
    @github = student.github
    @contact = format_contact(student)
  end


  def github=(github)
    @github = github
  end

  def contact=(contact)
    @contact = contact
  end

  def format_contact(student)
    contact_info = []
    contact_info << "Телефон: #{student.phone}" if student.phone
    contact_info << "Telegram: #{student.telegram}" if student.telegram
    contact_info << "Email: #{student.email}" if student.email
    contact_info.join(' ; ')
  end

  def to_s
    "ID: #{id}, ФИО: #{initials}, GitHub: #{@github}, Контакты: #{@contact}"
  end
end
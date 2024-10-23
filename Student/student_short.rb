require_relative 'student'
class Student_short 
  attr_reader :id, :initials, :github, :contact
  
  def initialize(student)
    self.id = student.id 
    self.initials = student.lastname + " " + student.firstname[0] + "." + student.surname[0] + "."
    self.github = student.github
    self.contact = format_contact(student)
  end

  def id=(id)
    @id = id
  end

  def initials=(initials)
    @initials = initials
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
    "ID: #{@id}, ФИО: #{@initials}, GitHub: #{@github}, Контакты: #{@contact}"
  end
end
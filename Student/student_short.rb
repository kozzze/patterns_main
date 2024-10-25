require_relative 'person'
class Student_short < Person

  attr_reader :initials, :contact
  
  def initialize(initials, id: nil, github: nil, contact: nil)
    #Конструктор суперкласса
    super(id: id, github: github)
    @initials = initials
    @contact = contact
  end


  def github=(github)
    @github = github
  end

  def self.from_student(student)
		new(student.initials, id: student.id, github: student.github, contact: student.contact)
	end

	def self.from_string(id, info_string)
		info = info_string.split(", ")
    initials = info[0]
		github = info[1] 
		contact = info[2]
		new(student.initials, id: id, github: github, contact: contact)
	end

  

  def to_s
    "ID: #{id}, ФИО: #{initials}, GitHub: #{@github}, Контакты: #{@contact}"
  end
end
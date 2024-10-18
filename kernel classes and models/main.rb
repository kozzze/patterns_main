require_relative 'student'

student1=Student.new(id:1, lastname: 'Голова',firstname: 'Максим', surname: 'Иванович',telegram: '@golova',email: 'golova@example.com',github:'https://github.com/noga')
student2 = Student.new(id:2, lastname: 'Нога', surname: 'Максимович',firstname: 'Иван',phone: '89174657428',telegram: '@noga',email: 'noga@example.com',github: 'https://github.com/noga')
puts student1.validate
puts student2.validate
student_short1=Student_short.new(student1)

puts student_short1.to_s

info_str = "Иванов И.И.; https://github.com/ivanov; Телефон: +79160000000; Telegram: @ivanov"
student_short2 = Student_short.new(2, info_str)

puts student_short2.to_s
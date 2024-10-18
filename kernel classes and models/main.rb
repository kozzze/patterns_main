require_relative 'student'

student1=Student.new(id:1, lastname: 'Голова',firstname: 'Максим', surname: 'Иванович',telegram: '@golova',email: 'golova@example.com',github:'https://github.com/noga')
student2 = Student.new(id:2, lastname: 'Нога', surname: 'Максимович',firstname: 'Иван',phone: '89174657428',telegram: '@noga',email: 'noga@example.com',github: 'https://github.com/noga')
puts student1.validate
puts student2.validate

puts student1.display_info
puts student2.display_info

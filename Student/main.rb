require_relative 'student'
require_relative 'student_short'

student1 = Student.new(id: 1, lastname: 'Голова', firstname: 'Максим', surname: 'Иванович', telegram: '@golova', email: 'golova@example.com')

student = Student.new(id: 2, lastname: "Иванов", firstname: "Иван", surname: "Иванович", phone: "+71234567890", telegram: "@ivanov", email: "ivanov@example.com", github: "https://github.com/ivanov")

student_short = Student_short.new(student)

puts student_short
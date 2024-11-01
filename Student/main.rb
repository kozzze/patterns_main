require_relative 'person'
require_relative 'student'
require_relative 'student_short'


student = Student.new(
    id: 1,
    lastname: "Иванов",
    firstname: "Иван",
    surname: "Иванович",
    phone: "+79184328574",
    email: "ivanov@mail.ur",
    github: "https://github.com/kozzze"
)

student_short = Student_short.from_student(student)

puts student_short.to_s

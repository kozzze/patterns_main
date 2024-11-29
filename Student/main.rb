require_relative 'person'
require_relative 'student'
require_relative 'student_short'


student = Student.new(
    id: 1,
    lastname: "Иванов",
    firstname: "Иван",
    surname: "Иванович",
    birth_date: "2003-04-04",
    phone: "+79184328574",
    email: "ivanov@mail.ur",
    github: "https://github.com/kozzze"
)


puts student

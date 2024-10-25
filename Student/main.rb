require_relative 'person'
require_relative 'student'
require_relative 'student_short'


student = Student.new(
    id: 1,
    lastname: "Иванов",
    firstname: "Иван",
    surname: "Иванович",
    phone: "+79161234567",
    telegram: "@ivanov",
    email: "ivanov@example.com",
    github: "https://github.com/ivanov"
)


student_short = Student_short.from_student(student)

# Вывод информации о Student_short
puts student_short.to_s
require_relative 'person'
require_relative 'student'
require_relative 'student_short'
require_relative 'student_tree'

students = [
  Student.new(lastname: "Иванов", firstname: "Иван", surname: "Иванович", birth_date: "21-02-2003"),
  Student.new(lastname: "Петров", firstname: "Петр", surname: "Петрович", birth_date: "15-02-2003"),
  Student.new(lastname: "Сидоров", firstname: "Сидор", surname: "Сидорович", birth_date: "10-12-2002"),
  Student.new(lastname: "Алексеев", firstname: "Алексей", surname: "Алексеевич", birth_date: "01-05-2003")
]

# Создаем дерево
tree = BinaryTree.new

# Добавляем студентов в дерево
students.each { |student| tree.insert(student) }

puts students

# Обход дерева (даты рождения должны быть в порядке возрастания)
puts "Студенты, отсортированные по дате рождения:"
tree.each { |student| puts student.obj }

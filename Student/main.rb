require_relative 'person'
require_relative 'student'
require_relative 'student_short'
require_relative 'student_tree'


 student1 = Student.new(lastname: "Иванов", firstname: "Иван", surname: "Иванович", birth_date: "21-02-2003")
 student2 = Student.new(lastname: "Петров", firstname: "Петр", surname: "Петрович", birth_date: "15-02-2003")
 student3 = Student.new(lastname: "Сидоров", firstname: "Сидор", surname: "Сидорович", birth_date: "10-12-2002")
 student4 = Student.new(lastname: "Алексеев", firstname: "Алексей", surname: "Алексеевич", birth_date: "01-05-2003")


tree = BinaryTree.new
tree.insert(student1)
tree.insert(student2)
tree.insert(student3)
tree.insert(student4)

tree.each {|student| puts student.to_s}



require_relative 'person'
require_relative 'student'
require_relative 'student_short'
require_relative 'student_tree'
require_relative './DataList/data_list'
require_relative './DataList/data_table'
require_relative './DataList/data_list_student_short.rb'


 student1 = Student.new(id:1, lastname: "Иванов", firstname: "Иван", surname: "Иванович", birth_date: "21-02-2003")
 student2 = Student.new(id:2, lastname: "Петров", firstname: "Петр", surname: "Петрович", birth_date: "15-02-2003")
 #student3 = Student.new(lastname: "Сидоров", firstname: "Сидор", surname: "Сидорович", birth_date: "10-12-2002")
 #student4 = Student.new(lastname: "Алексеев", firstname: "Алексей", surname: "Алексеевич", birth_date: "01-05-2003")

  #Student.new(id: 1, lastname: "Иванов", firstname: "Иван", surname: "Иванович", birth_date: "21-02-2003")
  #Student.new(id:2, lastname: "Петров", firstname: "Петр", surname: "Петрович", birth_date: "15-02-2003")
  #Student.new(id:3, lastname: "Сидоров", firstname: "Сидор", surname: "Сидорович", birth_date: "10-12-2002")
  #Student.new(id:4, lastname: "Алексеев", firstname: "Алексей", surname: "Алексеевич", birth_date: "01-05-2003")

#tree = BinaryTree.new
#tree.insert(student1)
#tree.insert(student2)
#tree.insert(student3)
#tree.insert(student4)

#tree.each {|student| puts student.to_s}

#puts student1>student2




student_short = Student_short.from_student(student1)
student_short2 = Student_short.from_student(student2)
list = DataListStudentShort.new([student_short],[student_short2])

list.select(0)
puts "Vibranie: #{list.get_selected}"
list.select(2)
puts "Vibranie: #{list.get_selected}"

puts "Table"
table = list.get_data
puts table.to_s
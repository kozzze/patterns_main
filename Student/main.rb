require_relative './model/person.rb'
require_relative './model/student.rb'
require_relative './model/student_short.rb'
require_relative './binary_tree/student_tree.rb'
require_relative './DataList/data_list.rb'
require_relative './DataList/data_table.rb'
require_relative './DataList/data_list_student_short.rb'
require_relative './student_list/student_list_json.rb'
require_relative './student_list/student_list_yaml.rb'
require_relative './student_list/interface.rb'


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

''' Lab4.1
student1 = Student.new(id: 1, lastname: "Иванов", firstname: "Иван", surname: "Иванович",github: "https://github.com/kozzze",email:"kozzz@mail.ru", birth_date: "21-02-2003")
student2 = Student.new(id: 2, lastname: "Петров", firstname: "Петр", surname: "Петрович", birth_date: "15-02-2003")

student_short1 = Student_short.from_student(student1)
student_short2 = Student_short.from_student(student2)
list = DataListStudentShort.new([student_short1, student_short2])

# Вывод данных таблицы
table = list.get_data
puts "Данные таблицы:"
table.rows.each { |row| puts row.join("\t") }

# Проверка выбранных студентов
list.select(4)
puts "Выбранные студенты: #{list.get_selected}"
'''

''' Lab4.2.JSON
file_path = ''
students_list = StudentsListJSON.new(file_path)
puts "Список студентов:"
students_list.students.each { |student| puts student.to_s }
new_student = Student.new(
  lastname: Ааиский,
  firstname: Антон,
  surname: Антоновчик,
  email: sidorov@mail.ru
)
students_list.add_student(new_student)
puts "\nПосле добавления нового студента:"
students_list.students.each { |student| puts student.to_s }
puts "\nПосле сортировки:" 
students_list.sort_by_surname_fullname!
students_list.students.each { |student| puts student.to_s }
'''

'''Lab4.4.YAML
file_path = /Users/kozzze/Desktop/Учеба/Паттерны_проектирования/labs/patterns_main/Student/student_list/students.yaml
students_list = StudentsListYAML.new(file_path)
puts "Список студентов:"
students_list.students.each { |student| puts student.to_s }
new_student = Student.new(
  lastname: Сидоров,
  firstname: Сидор,
  surname: Сидорович,
  email: sidorov@mail.r
)
students_list.add_student(new_student)
puts "\nПосле добавления нового студента:"
students_list.students.each { |student| puts student.to_s }
student = students_list.get_student_by_id(1)
puts "\nНайден студент с ID 1:"
puts student.to_s if student
students_list.delete_student_by_id(2)
puts "\nПосле удаления студента с ID 2:"
students_list.students.each { |student| puts student.to_s }
students_list.sort_by_surname_fullname!
puts "\nПосле сортировки по фамилии и имени:"
students_list.students.each { |student| puts student.to_s }
'''

'''Lab4 SuperClass
file_path_json = /Users/kozzze/Desktop/Учеба/Паттерны_проектирования/labs/patterns_main/Student/student_list/student.json
file_path_yaml = /Users/kozzze/Desktop/Учеба/Паттерны_проектирования/labs/patterns_main/Student/student_list/students.yaml


students_list_y = StudentsListYAML.new(file_path_yaml)
puts "Список студентов YAML:"
students_list_y.students.each { |student| puts student.to_s }


students_list_j = StudentsListJSON.new(file_path_json)
puts "Список студентов JSON:"
students_list_j.students.each { |student| puts student.to_s }
'''
 #Lab4 STRATEGY
file_json = "/Users/kozzze/Desktop/Учеба/Паттерны_проектирования/labs/patterns_main/Student/student_list/student.json"
json_strategy = StudentsListJSON.new

file2 = "/Users/kozzze/Desktop/Учеба/Паттерны_проектирования/labs/patterns_main/Student/student_list/students.yaml"
y_strategy = StudentsListYAML.new


new_student2 = Student.new(
  lastname: 'Катя',
  firstname: 'Крутой',
  surname: 'Андрей',
  email: 'fyutiriei@mail.ru',
  phone: '87667778834',
  telegram: '@qwqwetttgh',
  github: 'https://github.com/ertrgghnTeroK'

)
 # Используем JSON
students_list = StudentsList.new(file_json, json_strategy)
students_list.add_student(new_student2)
puts "JSON: Загруженные студенты:"
students_list.students.each { |student| puts student }
students_list.save_to_file

students_list.change_strategy(file2, y_strategy)

students_list.save_to_file
puts "ямл: Загруженные студенты:"
students_list.students.each { |student| puts student }




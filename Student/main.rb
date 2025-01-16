require_relative './model/person.rb'
require_relative './model/student.rb'
require_relative './model/student_short.rb'
require_relative './binary_tree/student_tree.rb'
require_relative './DataList/data_list.rb'
require_relative './DataList/data_table.rb'
require_relative './DataList/data_list_student_short.rb'
require_relative './student_list/student_list_json.rb'

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

'''Lab4.1
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
# Путь к JSON-файлу (проверьте, что он существует)
file_path = '/Users/kozzze/Desktop/Учеба/Паттерны_проектирования/labs/patterns_main/Student/student_list/student.json'

# Создаем объект списка студентов
students_list = StudentsListJSON.new(file_path)

# Выводим всех студентов
puts "Список студентов:"
students_list.students.each { |student| puts student.to_s }

# Добавляем нового студента
new_student = Student.new(
  lastname: 'Сидоров',
  firstname: 'Сидор',
  surname: 'Сидорович',
  email: 'sidorov@mail.ru'
)
students_list.add_student(new_student)

puts "\nПосле добавления нового студента:"
students_list.students.each { |student| puts student.to_s }


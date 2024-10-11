require_relative 'student'
begin
  student1=Student.new(id:1, lastname: 'Голова',firstname: 'Максим', surname: 'Иванович',phone: '+71936486347',telegram: '@golova',email: 'golova@example.com',github: 'https://github.com/golova')
rescue ArgumentError => e
  puts e.message
end
begin
  student2 = Student.new(id:2, lastname: 'Нога', surname: 'Максимович',firstname: 'Иван',phone: '89174657428',telegram: '@noga',email: 'noga@example.com',github: 'https://github.com/noga')
rescue ArgumentError => e
  puts e.message
end

begin
  student3 = Student.new(id:3, lastname: 'Рука',firstname: 'Александр', surname: 'Савельевич')
rescue ArgumentError => e
  puts e.message
  end
begin
  student4 = Student.new(id: 4, lastname: "Петров", firstname: "Петр", surname: "Петрович", phone: "+89476326547")
rescue ArgumentError => e
  puts e.message # Ожидаем сообщение о некорректном номере телефона
end

student1.display_info
student2.display_info
student3.display_info
student4.display_info
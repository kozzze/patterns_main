require_relative 'student'
student1 = Student.new(id:1, lastname: 'Голова',firstname: 'Максим', surname: 'Иванович',phone: '123-432',telegram: '@golova',email: 'golova@example.com',github: 'golova-git')
student2 = Student.new(id:1, lastname: 'Нога',firstname: 'Иван', surname: 'Максимович',phone: '654-890',telegram: '@noga',email: 'noga@example.com',github: 'noga-git')
student3 = Student.new(id:1, lastname: 'Рука',firstname: 'Александр', surname: 'Савельевич',phone: '563-134',telegram: '@ruchka',email: 'ruka@example.com',github: 'ruka-git')

student1.display_info
student2.display_info
student3.display_info
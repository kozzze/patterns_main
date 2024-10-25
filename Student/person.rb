class Person

  attr_reader :id, :lastname, :firstname, :surname
  
  def initialize(id: nil,lastname:,firstname:,surname:)
    self.id = id
    self.firstname = firstname
    self.lastname = lastname
    self.surname = surname
  end

  #Сеттеры
  def id=(id)
    @id = id
  end

  def lastname=(lastname)
    if self.class.name_valid?(lastname)
      @lastname = lastname
    else
      raise ArgumentError, "Фамилия введена неверно: #{lastname}"
    end
  end

  def firstname=(firstname)
    if self.class.name_valid?(firstname)
      @firstname = firstname
    else
      raise ArgumentError, "Имя введено неверно: #{firstname}"
    end
  end

  def surname=(surname)
    if self.class.name_valid?(surname)
      @surname = surname
    else
      raise ArgumentError, "Отчество введено неверно: #{surname}"
    end
  end

  #Валижация для имени
  def self.name_valid?(name)
    name && name =~ /^[A-Za-zА-Яа-яЁё\s-]+$/
  end
  def initials
    "#{@lastname} #{@firstname[0]}. #{@surname[0]}."
  end

  def full_name
    "#{@lastname} #{@firstname} #{@surname}"
  end
   




end 
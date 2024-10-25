class Person

  attr_reader :id, :github
  
  def initialize(id: nil,github: nil)
    self.id = id if id
    self.github = github if github
  end

  #Сеттеры
  def id=(id)
    @id = id
  end

  def github=(github)
    if self.class.valid_github?(github)
      @github = github
    else
      raise ArgumentError, "GitHub введен неверно: #{github}"
    end
  end 


  #Валижация для git
  def self.valid_github?(github)
    github=~/^(https?:\/\/)?(www\.)?github\.com\/[A-Za-z0-9._-]+$/
 end
   




end 
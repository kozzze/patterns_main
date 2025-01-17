class Singleton
  @@instance = nil  # Храним единственный объект

  def self.instance
    @@instance ||= new  # Создаём объект, если его ещё нет
  end

  private_class_method :new  # Запрещаем создание новых объектов
end

# Используем
a = Singleton.instance
b = Singleton.instance

puts a.object_id == b.object_id  # => true (это один и тот же объект)
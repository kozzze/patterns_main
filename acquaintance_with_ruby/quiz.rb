#Принимаем Имя Пользователя
if ARGV.empty?
  puts "Как тебя зовут?"
  name = gets.chomp
else
  name = ARGV[0]
end
puts "Hello, #{name}!"
# Спрашиваем какой любимый ЯП
puts "#{name}, какой твой любимый язык программирования?"
language = $stdin.gets.chomp.downcase
if language == 'ruby'
  puts "#{name}, ты полиза"
elsif language == 'c++'
  puts "#{name}, Сомнительно, но Окэй. ПССС, скоро будет Ruby"
elsif language =='assembly'
  puts "#{name}, мда..."
else
  puts "Не переживай, скоро будет Ruby "
end
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "print_result.rb"
require_relative "sum_result"

print = PrintResult.new
test = Test.new

puts "Здравствуйте, как ваше имя?"
name = STDIN.gets.chomp

if name == nil
  name = " СЕПИСНИТЕЛЬНЫЙ "
end

puts "Очень приятно #{name} ! Ответьте на вопросы.\n\n"
puts "Инструкция: Вашему вниманию предлагается несколько простых вопросов.,
Отвечайте быстро, однозначно: «ДА = 1», «Нет= 2», «Иногда= 3»\n"

until test.stoped?
  puts  test.next_question
  answer = 0
  while (answer != 1 && answer != 2 &&  answer != 3 )
    puts "Введите ваш вариант ответа: Да-1, Нет -2, Иногда -3"
    answer = STDIN.gets.to_i
  end
  test.points_result(answer)
end

print.print_result(test)

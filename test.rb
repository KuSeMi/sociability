if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/print_result"
require_relative "lib/sum_result"
puts 'Тест "ВАШ УРОВЕНЬ ОБЩИТЕЛЬНОСТИ"'
puts "Здравствуйте, как ваше имя?"
name = STDIN.gets.chomp
name = " СЕПИСНИТЕЛЬНЫЙ "if name == ''
puts "Очень приятно #{name} ! Ответьте на вопросы.\n"

test = SumResult.new
test.points_result
print = PrintResult.new
print.print_result(test)

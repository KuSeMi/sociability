class SumResult
  attr_reader :points

  def initialize
    current_path = File.dirname(__FILE__)
    questons_path = current_path + '/../data/questions.txt'

    File.open(questons_path,"r:UTF-8") {|file| @questions = file.readlines}
    @points = 0
  end

  def next_question
    answer = nil
    while (answer != 'да' && answer != 'нет' &&  answer != 'иногда' )
      puts "Введите ваш вариант ответа: Да, Нет, Иногда"
      answer = STDIN.gets.chomp.downcase
    end
    if (answer == 'да')
      @points += 2
    else (answer =='иногда')
    @points += 1
    end

  end

  def points_result
    @questions.each do |question|
      puts question
      next_question
    end
  end
end




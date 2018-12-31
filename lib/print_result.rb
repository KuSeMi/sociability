class PrintResult
  def initialize
    current_path = File.dirname(__FILE__)
    results_path = current_path + '/../data/results.txt'

    file = File.new(results_path, "r:UTF-8")
    @results = file.readlines
    file.close
  end

  def print_result(test)
    puts "Вы набрали : #{test.points} очков!"

    case test.points
    when 30..32 then puts @results[0]
    when 25..29 then puts @results[1]
    when 19..24 then puts @results[2]
    when 14..18 then puts @results[3]
    when 9..13 then puts @results[4]
    when 4..8 then puts @results[5]
    else puts @results[6]
    end
  end
end

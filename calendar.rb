require 'date'

class Calendar

  def initialize(year,month)
    @year = year
    @month = month
    @weekday = Date.new(year, month, 1).wday
    @dend = Date.new(year, month, -1).to_s
  end

  def output
    monthday = Array.new
    for i in 0..@weekday.to_i
      unless i == 0 then
        monthday <<0
      end
    end

    for i in 1..@dend[-2,2].to_i
      monthday << i
    end

    print "\n"
    puts @year.to_s + "-" + @month.to_s
    week = ["Su","Mo","Tu","We","Th","Fr","Sa"]

    week.each do |elem|
      print elem + " "
    end
    print "\n"

    j = 0
    for i in 0..monthday.length.to_i
      day = format("%02d",monthday[i].to_i) + " "

      j = j + 1
      if j == 7 then
        if day.strip.to_s == "00" then
          print " "
        else
          puts day
        end
        j = 0
      else
        if day.strip.to_s == "00" then
          print "   "
        else
          print day
        end
      end
    end
  end

end

puts "年度を入力して下さい"
year = gets.to_i

12.times do |i|
  calc = Calendar.new(year,i+1)
  calc.output
end

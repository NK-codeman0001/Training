# Possible keys are: :year, :month, :day, :yday, :wday, :hour, :min, :sec, :subsec, :dst, :zone.

def time_func (t)
  puts t.ctime
  if t in wday: 3, day: ..7  # uses deconstruct_keys underneath
    puts "first Wednesday of the month"
  end
  #=> prints "first Wednesday of the month"
  case t
  in year: ...2022
    puts "too old"
  in month: ..9
    puts "quarter 1-3"
  in wday: 1..5, month:
    puts "working day in month #{month}"
  end
  #=> prints "working day in month 10"

  # Note that deconstruction by pattern can also be combined with class check:
  # if t in Time(wday: 3, day: ..7)
  #   puts "first Wednesday of the month"
  # end
end

puts time_func(Time.utc(2022, 10, 5, 21, 25, 30))
puts time_func(Time.new)
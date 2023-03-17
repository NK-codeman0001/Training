=begin 
45. Given a range of years as a string, return the number of leap years there are within the range (inclusive).
=end

require 'date'

def count_leap_years(start_year,end_year)
  s_date= Date.new(start_year.to_i)
  e_date= Date.new(end_year.to_i)
  if s_date>e_date
    return "Invalid Range of Years"
  end
  leap_count=0
  while (s_date.year <= e_date.year)
    if s_date.leap?
      leap_count+=1
    end
    s_date=s_date.next_year
  end
  return leap_count
end

p count_leap_years("2019","2022") #1
p count_leap_years("1947","2023") #19
p count_leap_years("2024","2023") #"Invalid Range of Years"
=begin 
47. Given the month and year as numbers, return whether that month contains a Friday 13th.
=end
require 'date'

def is_friday_13th(month,year)
  return Date.new(year,month,13).friday?
end

p is_friday_13th(1,2023) #true
p is_friday_13th(10,2023) #true
p is_friday_13th(2,2023) # false
p is_friday_13th(3,2023) # false
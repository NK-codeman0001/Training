=begin 

44. Create a function that takes the month and year (as integers) and returns the number of days in that
month.

=end
require 'date'

def number_of_days_in_month(m,y)
  date= Date.new(y,m,1)
  return  (date.next_month - date).to_i
end

p number_of_days_in_month(2,2020)  #29
p number_of_days_in_month(1,2023)  #31
p number_of_days_in_month(2,2023)  #28
p number_of_days_in_month(3,2023)  #31
p number_of_days_in_month(4,2023)  #30


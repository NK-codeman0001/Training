=begin 
46. Given the parameters day, month and year, return whether that date is a valid date.
is_valid_date(35, 2, 2020) ➞ false
# February doesn't have 35 days.
=end
require 'date'

def is_valid_date(day, month, year)
  # default format for date is Year-Month-Day
  return Date.valid_date?(year, month, day)
end

p is_valid_date(35, 2, 2020) # false
p is_valid_date(30, 2, 1700) # false
p is_valid_date(10, 12, 2000) # true
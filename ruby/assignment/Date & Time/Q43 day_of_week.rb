=begin 
43. Write a function that, given a date (in the format MM/DD/YYYY), returns the day of the week as a string.
Each day name must be one of the following strings: "Sunday", "Monday", "Tuesday", "Wednesday",
"Thursday", "Friday", or "Saturday".
To illustrate, the day of the week for "12/07/2016" is "Wednesday".

=end
require 'time'

def day_of_week(str)
  date = Time.strptime(str,'%m/%d/%Y')
  return date.strftime('%A')
end

p day_of_week("12/07/2016") #"Wednesday"
p day_of_week("3/17/2023")  #"Friday"
=begin 
50. If today was Monday, in two days, it would be Wednesday.
Create a function that takes in an array of days as input and the number of days to increment by. Return an
array of days after n number of days has passed.
after_n_days(["Thursday", "Monday"], 4) ➞ ["Monday", "Friday"]
=end

=begin 

-----------------Note-------------
require "date"
DateTime.parse("Wednesday").wday # => 3

day_number = 2
Date::DAYNAMES[day_number]
# => 'Tuesday'

=end

require 'date'
# <<<<Solution 1 (using hash)>>>>
# def after_n_days(arr,n)
#   wdays={"Sunday" => 0,"Monday"=> 1,"Tuesday"=> 2,"Wednesday"=> 3,"Thursday"=> 4,"Friday"=> 5,"Saturday"=> 6}
#   for i in 0...arr.length
#     arr[i]=wdays.key(((wdays[arr[i]]+n)%7))
#   end
#   return arr
# end

# #<<<<Solution 2>>>>
# def after_n_days(arr,n)
#   for i in 0...arr.length
#     arr[i]=Date::DAYNAMES[(DateTime.parse(arr[i]).wday + n) %7]
#   end
#   return arr
# end

#<<<<Solution 3>>>>
def after_n_days(arr,n)
  for i in 0...arr.length
    arr[i]=(DateTime.parse(arr[i]) + n).strftime('%A')
  end
  return arr
end

p after_n_days(["Thursday", "Monday"], 4) # ["Monday", "Friday"]
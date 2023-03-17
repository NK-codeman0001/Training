=begin 
42. Create a function that takes time1 and time2 and return how many hours and minutes have passed
between the two times.
=end
require 'time'

def time_passed(time1,time2)
  t1 = Time.parse(time1)
  t2 = Time.parse(time2)
  h = ((t2-t1)/(60*60)).to_i
  m =  ((t2-t1)/(60) - (h*60)).abs.to_i
  if t1>t2
    h+=24
  end
  return "Hours:#{h} Minutes:#{m}"
end

p time_passed("12:33:22","22:22:22") # "Hours:9 Minutes:49"
p time_passed("12:33:22","12:33:23") # "Hours:0 Minutes:0"
p time_passed("22:22:22","12:33:22") # "Hours:15 Minutes:49"
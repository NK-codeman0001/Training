=begin 
4. Given an n-digit large number in form of string, check whether it is divisible by 7 or not. Print 1 if divisible by 7, otherwise 0.
=end

def divisible_by_7(str)
  return str.to_i % 7 ==0 ? 1: 0
end

p divisible_by_7("11111")
p divisible_by_7("7")
p divisible_by_7("0")
p divisible_by_7("")
p divisible_by_7("49")
p divisible_by_7("11")
p divisible_by_7("123456789")
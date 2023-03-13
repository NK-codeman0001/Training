=begin
Product of Digits of Sum
(very hard, arrays, math, numbers)
Create a function that takes one, two or more numbers as arguments and adds them together to get a new number. The function then repeatedly multiplies the digits of the new number by each other, yielding a new number, until the product is only 1 digit long. Return the final product.
Examples

sum_dig_prod(16, 28) ➞ 6
# 16 + 28 = 44
# 4 * 4 =  16
# 1 * 6 = 6

sum_dig_prod(0) ➞ 0

sum_dig_prod(1, 2, 3, 4, 5, 6) ➞ 2

Notes

The input of the function is at least one number.
=end

def sum_dig_prod(*arr)
  t=arr.reduce(0){|s,n| s+n}
  t=t.to_s.chars
  t.map! {|i| i.to_i}
  while t.reduce(1){|s,n| s*n}>9
    t=t.reduce(1){|s,n| s*n}
    t=t.to_s.chars
    t.map! {|i| i.to_i}
  end
  t=t.reduce(1){|s,n| s*n}
  return t 
end

p sum_dig_prod(16, 28) # 6
p sum_dig_prod(0) # 0
p sum_dig_prod(1, 2, 3, 4, 5, 6) # 2
=begin 

16. Given an integer limit being the upper limit of the range of interest, implement a function that returns the last 15 palindromes numbers lower or equal to limit as an array sorted ascendingly.

=end

def is_palindrome(num)
  num=num.to_s.chars
  len = num.length
  for i in 0...(len/2)
    if num[i]!=num[len-1-i]
      return false
    end
  end
  return true
end

def array_of_palindrome_numbers(upper_limit)
  ans=[]
  while ans.length!=15
    if is_palindrome(upper_limit)
      ans<<upper_limit
    end
    upper_limit-=1
  end
  return ans.sort
end


p array_of_palindrome_numbers(151) # [ 11, 22, 33, 44, 55, 66, 77, 88, 99, 101, 111, 121, 131, 141, 151]
 
p array_of_palindrome_numbers(600) # [454, 464, 474, 484, 494, 505, 515, 525, 535, 545, 555, 565, 575, 585, 595]
 
p array_of_palindrome_numbers(999999) # [ 985589, 986689, 987789, 988889, 989989, 990099, 991199, 992299, 993399, 994499, 995599, 996699, 997799, 998899, 999999]
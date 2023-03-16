=begin 

17. Write a function which takes an integer (positive) and return an array of Fibonacci number of each index in index position till given number.

=end

def array_of_fibonacci(num)
  ans=[]
  for i in 0..num
    if i<2
      ans<<i
    else
      ans << (ans[i-1] + ans[i-2])
    end
  end
  return ans
end

p array_of_fibonacci(0) # [0]
p array_of_fibonacci(1) # [0, 1]
p array_of_fibonacci(2) # [0, 1, 1]
p array_of_fibonacci(10) # [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55] 
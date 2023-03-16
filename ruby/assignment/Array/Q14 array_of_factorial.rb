=begin 

14. Write a function which takes an integer (positive) and return an array of factorials of each index in index position till given number. 

=end

def array_of_factorial(n)
  sum=1
  ans=[1]
  for i in 1..n
    sum*=i
    ans<<sum
  end
  return ans
end

p array_of_factorial(5) #[1, 2, 6, 24, 120]
p array_of_factorial(0) #[1]
p array_of_factorial(1) #[1]
p array_of_factorial(2) #[1, 2]
p array_of_factorial(10) #[1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800]
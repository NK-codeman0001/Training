=begin

15. Create a function that takes an array of numbers and returns a new array containing only prime numbers.

=end

def is_prime(num)
  for i in 2..(Math.sqrt(num))
    if num%i==0
      return false
    end
  end
  return true
end

def prime_only_array(arr)
  arr.keep_if {|ele| ele>1 && is_prime(ele) }
end

p prime_only_array([0,-1,1,2,3,4,5,6,7,8,9]) #[2, 3, 5, 7]
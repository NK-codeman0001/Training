=begin 
18. Write a function which takes an array of integers, return how many of them contain an even number of digits.
=end

def count_of_even_length_digits(nums)
  count=0
  nums.each do |num|
    if (num.to_s.chars).length % 2 ==0
      count +=1
    end
  end
  return count
end

p count_of_even_length_digits([1,22,333,4444,55555]) # 2
p count_of_even_length_digits([555,901,482,1771]) # 1
p count_of_even_length_digits([12,345,2,6,7896]) # 2

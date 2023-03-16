=begin 

19. Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product. Elements can also be negative numbers.
Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.

=end

def max_product(nums)
  product_arr =[]
  subarrs=[]
  for i in 0...nums.length
    for j in i...nums.length
      subarrs << nums[i..j]
    end
  end

 # take product of each subarr and store in a arr
 subarrs.each do |subarr|
  p = subarr.reduce(1) { |product, num| product*num}
  product_arr << p
 end
 
 #find max and return it
 return product_arr.max
end

p max_product([2,3,-2,4]) # 6
p max_product([-2,0,-1]) #  0
p max_product([2,-5,-2,-4,3]) #  24

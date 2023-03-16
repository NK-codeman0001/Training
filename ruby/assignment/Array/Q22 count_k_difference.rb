=begin 
22. Given an integer array nums and an integer k, return the number of pairs (i, j) where i < j such that
|nums[i] - nums[j]| == k.
The value of |x| is defined as:
x if x >= 0.
-x if x < 0.
=end

def count_k_difference(nums, k)
  count = 0
  for i in 0...nums.length
    for j in i+1...nums.length
      if (nums[i] - nums[j]).abs == k
        count +=1
      end
    end
  end
  return count
end

p count_k_difference([1,2,2,1],1)  #4
p count_k_difference([1,3],3)  #0
p count_k_difference([3,2,1,5,4],2)  #3
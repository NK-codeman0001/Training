=begin 
23. Given an array nums. We define a running sum of an array as running Sum[i] = sum( nums[0]…nums[i]).
Return the running sum of nums.
=end

def running_sum(nums)
  sum =0
  for i in 0...nums.length
    sum += nums[i]
    nums[i] = sum
  end 
  return nums
end

p running_sum([1,2,3,4]) # [1,3,6,10]
p running_sum([1,1,1,1,1]) # [1,2,3,4,5]
p running_sum([3,1,2,10,1]) # [3,4,6,16,17]
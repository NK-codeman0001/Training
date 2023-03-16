=begin 

31. Given an array of integers nums and an integer target, return indices of the two numbers such that they
add up to target. You may assume that each input would have exactly one solution, and you may not use
the same element twice. You can return the answer in any order.

=end

def two_sum(nums, target)
  records = Hash.new(0)
  records[nums[0]]=0
  for i in 1...nums.length
    temp = target-nums[i]
    if records.include?(temp)
      return records[temp],i
    end
    records[nums[i]]=i
  end
end

p two_sum([2,7,11,15],9) # [0,1]
p two_sum([3,2,4],6) # [1,2]
p two_sum([3,3],6) # [0,1]
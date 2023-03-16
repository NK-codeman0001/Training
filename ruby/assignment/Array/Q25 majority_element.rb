=begin 

25. Given an array nums of size n, return the majority element. The majority element is the element that
appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

=end

def majority_element(nums)
  return nums.sort_by {|num| nums.count(num)} [-1]
end

p majority_element([3,2,3])  # 3
p majority_element([2,2,1,1,1,2,2])  # 2
=begin 
27. Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers. Return any array that satisfies this condition.
=end

def sort_array_by_parity(nums)
  return nums.sort_by{|num| num%2}
end

p sort_array_by_parity([3,1,2,4])  # [2,4,3,1]
p sort_array_by_parity([0])  # [0]

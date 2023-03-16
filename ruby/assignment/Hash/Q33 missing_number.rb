=begin 
33. Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range
that is missing from the array.
=end
#h.key(0) # => :foo
def missing_number(nums)
  records= Hash.new(0)
  for i in 0..nums.length
    records[i]=0
  end
  for i in 0..nums.length
    records[nums[i]]+=1
  end
  return records.key(0)
end

p missing_number([3,0,1])  # 2
p missing_number([0,1])  # 2
p missing_number([9,6,4,2,3,5,7,0,1])  # 8
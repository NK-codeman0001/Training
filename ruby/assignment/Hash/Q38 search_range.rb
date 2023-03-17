=begin 
38. Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a
given target value.
If target is not found in the array, return [-1, -1].
=end

# <<<<< Solution 1 >>>>>
# def search_range(nums, target)
#     records = Hash.new([])
#     for i in 0...nums.length
#       records[nums[i]]=[]
#     end
#     for i in 0...nums.length
#       records[nums[i]] <<i
#     end
#     return records[target].empty? ? [-1, -1] : [records[target][0],records[target][-1]]
# end

# <<<<< Solution 2 >>>>>
def search_range(nums, target)
  flag_first_index=false
  ans=[-1,-1]
  if !(nums.include?(target))
    return ans
  end
  records = Hash.new(0)
  for i in 0...nums.length
    records[i]=nums[i]
  end
  records.each do |k,v|
    if v==target && !flag_first_index
      ans[0]=k
      flag_first_index=true
    elsif flag_first_index && v==target
      ans[1]=k
    end
  end
  ans[1] = ans[1]==-1? ans[0]: ans[1]
  return ans
end

p search_range([5,7,7,8,8,10],8)  # [3,4]
p search_range([5,7,7,8,10],8)  # [3,3]
p search_range([5,7,7,8,8,10],6)  #  [-1,-1]
p search_range([],0)  #  [-1,-1]

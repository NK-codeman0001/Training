=begin 

11 .You are given an array of strings nums and an integer k. Each string in nums represents an integer without leading zeros. 
Return the string that represents the kth largest integer in nums. 
Note: Duplicate numbers should be counted distinctly. For example, if nums is ["1","2","2"], "2" is the first largest integer, "2" is the second-largest integer, and "1" is the third-largest integer. 

=end

def kth_largest_integer(nums,k)
  nums.sort_by! {|ele| ele.to_i}
  return nums[-k]
end

p kth_largest_integer(["1","2","2"],1) #"2"
p kth_largest_integer(["3","6","7","10"],4) #"3"
p kth_largest_integer(["2","21","12","1"],3) #"2"
p kth_largest_integer(["0","0"],2) #"0"
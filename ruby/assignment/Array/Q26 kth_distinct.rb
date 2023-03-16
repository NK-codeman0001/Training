=begin 
26. A distinct string is a string that is present only once in an array. Given an array of strings arr, and an integer
k, return the kth distinct string present in arr. If there are fewer than k distinct strings, return an empty
string "".
Note that the strings are considered in the order in which they appear in the array.
=end

def kth_distinct(arr, k)
  temp_arr= arr.uniq
  arr.each do |ele|
    if arr.count(ele)>1
      temp_arr.delete(ele)
    end
  end
  return temp_arr[k-1].nil? ? "" : temp_arr[k-1]
end

p kth_distinct(["d","b","c","b","c","a"],2)  #"a"
p kth_distinct(["aaa","aa","a"], 1)  # "aaa"
p kth_distinct(["a","b","a"], 3)  # ""

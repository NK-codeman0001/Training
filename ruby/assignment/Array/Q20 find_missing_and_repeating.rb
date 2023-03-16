=begin 
20. Given an unsorted array Arr of size N of positive integers. One number 'A' from set {1, 2, …N} is missing
and one number 'B' occurs twice in array. Find these two numbers
=end

def find_missing_and_repeating(arr,n)
  a=nil
  b=nil
  for i in 1..n
    if arr.count(i)==0 && a.nil?
      a=i
    end
    if arr.count(arr[i])>1 && b.nil?
      b=arr[i]
    end
  end
  return a,b
end

p find_missing_and_repeating([2, 2], 2)  # [1, 2]
p find_missing_and_repeating([1, 3, 3], 3)  # [2 , 3]
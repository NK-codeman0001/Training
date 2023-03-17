=begin

39. Given two unsorted arrays A of size N and B of size M of distinct elements, the task is to find all pairs from
both arrays whose sum is equal to X.

=end
# <<<< Solution 1>>>>
# def find_all_pairs(a,b,x)
#   records =  Hash.new(0)
#   for i in 0...a.length
#     for j in 0...b.length
#       if(a[i]+b[j]==x)
#         records[a[i]]=b[j]
#       end
#     end
#   end
#   return records.to_a
# end

# <<<< Solution 2>>>>
def find_all_pairs(a,b,x)
  sum_diff =  Hash.new()
  records =  Hash.new()
  b.each {|ele| sum_diff[x-ele]=ele}
  a.each do |ele|
    if !(sum_diff[ele].nil?)
      records[ele]=sum_diff[ele]
    end
  end
  return records.to_a
end

p find_all_pairs([1, 2, 4, 5, 7],[5, 6, 3, 4, 8] ,9)   # [[1 ,8 ] , [4 ,5 ] , [5 ,4 ]]
p find_all_pairs([-1, -2, 4, -6, 5, 7],[6, 3, 4, 0],8)  # [[4 , 4], [5 , 3]]
=begin

34. Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the
result must be unique and you may return the result in any order.

=end

def intersection(nums1, nums2)
  records = Hash.new(0)
  intersection_hash= Hash.new(0)
  if nums1.length < nums2.length
    nums1, nums2 = nums2, nums1
  end
  nums1.each {|ele| records[ele]+=1}
  # p records
  for i in 0...nums2.length
    if records[nums2[i]]!=0
      intersection_hash[nums2[i]]+=1
    end
  end
  return intersection_hash.keys
end

p intersection([1,2,2,1],[2,2])  # [2]
p intersection([4,9,5],[9,4,9,8,4])  # [9,4]
=begin

1. Create a function that takes an array of strings and integers, and filters out the array so that it returns an array of integers only.

=end

def filter_array (arr)
  return arr.select {|i| i.class == Integer}
end

p filter_array ([1,2,3,4,5,6,7,8,9])
p filter_array ([])
p filter_array (['a','b','A','Aaddd11'])
p filter_array (['A','Aa','a','@','.',1, '1'])
p filter_array ([1,2,1,3,2])


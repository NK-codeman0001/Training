=begin 
36. Given a string text, you want to use the characters of text to form as many instances of the word "balloon"
as possible. You can use each character in text at most once. Return the maximum number of instances
that can be formed.
Example: loonballxballpoon
You can create only 2 balloon from example text, so return 2
=end

def max_number_of_balloons(text)
  map = Hash.new(0)
  text.chars.each {|i| map[i]+=1}
  nums=[map['b'],map['a'],map['l']/2,map['o']/2,map['n']]
  return nums.min
end

p max_number_of_balloons("nlaebolko")  # 1
p max_number_of_balloons("loonbalxballpoon")  # 2
p max_number_of_balloons("leetcode")  # 0
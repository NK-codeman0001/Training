=begin

10. Given a string s and an array of strings words, determine whether s is a prefix string of words. 
A string s is a prefix string of words if s can be made by concatenating the first k strings in words for some 
positive k no larger than words.length. Return true if s is a prefix string of words, or false otherwise. 

=end

def is_prefix_string(s,words)
  temp = ""
  words.each do |word|
    temp +=word
    if temp == s.split(' ').join
      return true
    end
  end
  return false
end

p is_prefix_string("iloveleetcode",["i","love","leetcode","apples"])  # true
p is_prefix_string("iloveleetcode",["apples","i","love","leetcode"])   # false
p is_prefix_string("a",["aa","aaaa","banana"])  #false
p is_prefix_string("good morning",["good","morning", ",","everyone"]) # true
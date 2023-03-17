=begin 
35. You are given two strings of the same length s and t. In one step you can choose any character of t and
replace it with another character. Return the minimum number of steps to make t an anagram of s. An
Anagram of a string is a string that contains the same characters with a different (or the same) ordering.
=end

def min_steps(s, t)
  #store both in hash
  record_s = Hash.new(0)
  record_t = Hash.new(0)
  
  s.each_char {|ele| record_s[ele]+=1}
  t.each_char {|ele| record_t[ele]+=1}
  
  record_t.each_pair {|k,v| record_s[k]-=v}
  return record_s.values.delete_if {|ele| ele <1}.reduce(0) {|sum, num| sum + num} 
end

p min_steps("bab","aba") # 1
p min_steps("leetcode","practice") # 5
p min_steps("anagram","mangaar") # 0
=begin 
  7. Given two strings s and t, return true if t is an anagram of s, and false otherwise. 
=end

def is_anagram(s,t)
  s= s.downcase.split('').sort.join
  t= t.downcase.split('').sort.join
  return t==s
end

p is_anagram("anagram","nagaram")  # true
p is_anagram("rat","car")  # false
p is_anagram("Neeraj", "Jareen")  #  true
p is_anagram("12345", "54321")  #  true
p is_anagram("12345", "67890")  #  false
p is_anagram("Beryl Systems", "Systems Beryl")  #  true
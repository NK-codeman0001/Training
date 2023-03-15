=begin 
9. Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.
=end

def first_nonrepeating_char_index(s)
  len=s.length
  for i in 0...len
    if s.count(s[i])==1
      return i
    end
  end
  return -1
end

p first_nonrepeating_char_index("Neeraj Kumar") #0
p first_nonrepeating_char_index("") #-1
p first_nonrepeating_char_index("aAaAb") #4
p first_nonrepeating_char_index("aaaBBB$a") #6

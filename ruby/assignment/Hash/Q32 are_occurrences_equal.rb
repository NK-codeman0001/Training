=begin 
32. Given a string s, return true if s is a good string, or false otherwise. A string s is good if all the characters
that appear in s have the same number of occurrences (i.e., the same frequency).
=end

def are_occurrences_equal(s)
  records= Hash.new(0)
  s.each_char {|c| records[c]+=1}
  values=records.values
  return values.uniq.length ==1    
end

p are_occurrences_equal("abacbc") # true
p are_occurrences_equal("aaabb") # false
=begin 

30. A pangram is a sentence where every letter of the English alphabet appears at least once.Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or
false otherwise.

=end

def check_if_pangram(sentence)
  char_count = Hash.new(0)
  sentence.each_char {|c| char_count[c]+=1}
  return char_count.length == 26    
end

p check_if_pangram("thequickbrownfoxjumpsoverthelazydog")  # true
p check_if_pangram("leetcode")  # false
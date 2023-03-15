=begin

3. Given a string s, reverse only all the vowels in the string and return it.The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both cases.

=end

def rev_vowels(s)
  vowel_arr=[]
  s.each_char {|i| vowel_arr << i if i.match?(/[aeiouAEIOU]/)}
  for i in 0...s.length
    if s[i].match?(/[aeiouAEIOU]/)
      s[i]=vowel_arr.pop
    end
  end
  return s
end

p rev_vowels("Neeraj")  # "Naerej"
p rev_vowels("")  # ""
p rev_vowels("Apple is Red")  # "eppli es RAd"
p rev_vowels("Apple") # "epplA"
p rev_vowels("Beryl SYSTEMS") # "BEryl SYSTeMS"

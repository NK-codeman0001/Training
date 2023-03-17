=begin 
37. Given a string s which consists of lowercase or uppercase letters, return the length of the longest
palindrome that can be built with those letters.Letters are case sensitive, for example, "Aa" is not
considered a palindrome here.

=end
#logic:
# 1. initialize hash to store all count of each characters.
# 2. we basically need to add all count of even number character, because a palindrome can be formed with just any even count of character.
# 3. if there is odd count of character, for example if we have 7 "a", we need to add the maximum even number which is 6 into result, because we want to form the longest palindrome and a palindrome can only contain 1 odd count character.
# 4. whenever there is an odd count character, we toggle the has_odd to true, in the end if has_odd is true, we add 1 to the result before returning the result.

def longest_palindrome(s)
  records = Hash.new(0)
  s.each_char{|c| records[c]+=1}
  even_count =0
  odd_count =0
  odd_flag = false
  records.each do |k,v|
    if v%2==0
      even_count+=v
    else
      odd_flag = true
      odd_count += (v -1)     
    end
  end
  return odd_flag ? odd_count + even_count + 1 : odd_count + even_count
end

p longest_palindrome("abccccdd")  # 7
p longest_palindrome("a")  # 1
p longest_palindrome("abccccddd")  # 7
p longest_palindrome("ccc")  # 3
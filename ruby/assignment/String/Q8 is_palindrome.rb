=begin 
8. A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers. Given a string s, return true if it is a palindrome, or false otherwise

=end

def is_palindrome(phrase)
  phrase= phrase.downcase
  if phrase.size < 2
    return true 
  end
  phrase.delete!('^a-zA-Z0-9')
  return phrase==phrase.reverse
end

p is_palindrome("Mr. Owl ate my metal worm") #true
p is_palindrome("Do geese see God?") #true
p is_palindrome("Was it a car or a cat I saw?") #true
p is_palindrome("working at Beryl Systrms") #false
p is_palindrome("A man, a plan, a canal: Panama") #true
p is_palindrome("race a car") #false
p is_palindrome(" ") #true



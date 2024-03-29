=begin 
5. Given a string S, print all permutations of a given string.
=end

def permutations(s)
  len =s.length
   s = s.chars
   ans =[]
   s.permutation(len) {|pm| ans << pm.join }
   return ans.uniq
end

p permutations("aA")
p permutations("aa")
p permutations("")
p permutations("BS")
p permutations("Beryl")
=begin 

2. Write a function to return reverse of a string using recursion.

=end

def string_rev_rec (str, s=0)
  len = str.length
  if s>=len/2 || len <2
    return str
  end
  str[s], str[len - s -1] = str[len - s -1] , str[s]
  # p str
  string_rev_rec(str, s+1)
end

p string_rev_rec("Neeraj")
p string_rev_rec("")
p string_rev_rec("A")
p string_rev_rec("aA")
p string_rev_rec("aaaaa@1#AAAAA")

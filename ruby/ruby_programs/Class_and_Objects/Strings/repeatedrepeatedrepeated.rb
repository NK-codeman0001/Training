=begin
💥repeatedrepeatedrepeated💥

This challenge concerns strings such as:

"repeatedrepeatedrepeated"

... that are obtained by repeating a smaller string, which in this case is the string "repeated".

On a related note, since the string above is made of 3 repetitions, one way to produce this string is via the code "repeated" * 3.

Write a function that, given a string, either:

    Returns false if the string isn't made by repeating a smaller string or ...
    Returns the number of repetitions if the string repeats a smaller string.

Examples

is_repeated("repeatedrepeatedrepeated") ➞ 3

is_repeated("overintellectualizations") ➞ False

is_repeated("nononononononononononono") ➞ 12

is_repeated("moremoremoremoremoremore") ➞ 6

is_repeated(",,,,,,,,,,,,,,,,,,,,,,,,") ➞ 24

Notes

To keep things a little simpler, all strings in the tests will have length exactly 24, just as in all the examples above. In particular, the answers will always be divisors of 24.
=end
# <<<<<<<<<< Soln1 >>>>>>>>>>
def is_repeated(strn)
	ans=0
  l=strn.length
  s=0
  e=strn.index(strn[0],1)
  w=strn[s...e]
  ans= strn.scan(w).length
  return ans==1 ? false : ans
end


p is_repeated("repeatedrepeatedrepeated") # 3
p is_repeated("overintellectualizations") # False
p is_repeated("nononononononononononono") # 12
p is_repeated("moremoremoremoremoremore") # 6
p is_repeated(",,,,,,,,,,,,,,,,,,,,,,,,") # 24

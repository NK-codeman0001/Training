=begin 
1189. Maximum Number of Balloons
Easy

Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.

You can use each character in text at most once. Return the maximum number of instances that can be formed.

 

Example 1:

Input: text = "nlaebolko"
Output: 1

Example 2:

Input: text = "loonbalxballpoon"
Output: 2

Example 3:

Input: text = "leetcode"
Output: 0

 

Constraints:

    1 <= text.length <= 104
    text consists of lower case English letters only.


=end

# @param {String} text
# @return {Integer}
# <<--------Sol1-------->>
# def max_number_of_balloons(text)
#   str="balon"
#   ans=[]
#   for i in 0...str.length
#     ans[i]= text.count(str[i])
#   end
#   ans[2]/=2
#   ans[3]/=2
#   return ans.min
# end
def max_number_of_balloons(text)
  map = Hash.new(0)
  text.chars.each {|i| map[i]+=1}
  nums=[map['b'],map['a'],map['l']/2,map['o']/2,map['n']]
  return nums.min
end
p max_number_of_balloons("nlaebolko") #Output: 1

p max_number_of_balloons("loonbalxballpoon") #Output: 2
p max_number_of_balloons("leetcode") #Output: 0
p max_number_of_balloons("balon") #Output: 0
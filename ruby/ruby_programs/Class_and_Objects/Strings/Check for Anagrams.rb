=begin

Check for Anagrams

Create a function that takes two strings and returns either true or false depending on whether they're anagrams or not.
Examples

is_anagram("cristian", "Cristina") ➞ true

is_anagram("Dave Barry", "Ray Adverb") ➞ true

is_anagram("Nope", "Note") ➞ false

Notes

    Should be case insensitive.
    The two given strings can be of different lengths.

=end

def is_anagram(s1, s2)
	s1 = s1.downcase.chars.sort.join
  s2 = s2.downcase.chars.sort.join
return s1===s2
end

p is_anagram("cristian", "Cristina") # true
p is_anagram("Dave Barry", "Ray Adverb") # true
p is_anagram("Nope", "Note") # false

=begin

Create a function that takes a string as an argument and returns a coded (h4ck3r 5p34k) version of the string.
Examples

hacker_speak("javascript is cool") ➞ "j4v45cr1pt 15 c00l"
hacker_speak("programming is fun") ➞ "pr0gr4mm1ng 15 fun"/
hacker_speak("become a coder") ➞ "b3c0m3 4 c0d3r"

Notes

In order to work properly, the function should replace all "a"s with 4, "e"s with 3, "i"s with 1, "o"s with 0, and "s"s with 5.

=end

def hacker_speak(str)
  n=str.size
  for i in 0...n
    if str[i]=='a'
      str[i]=4.to_s
    elsif str[i]=='e'
      str[i]=3.to_s
    elsif str[i]=='i'
      str[i]=1.to_s
    elsif str[i]=='o'
      str[i]=0.to_s
    elsif str[i]=='s'
      str[i]=5.to_s
    end
  end
  return str
end

puts hacker_speak("javascript is cool")
puts hacker_speak("programming is fun")
puts hacker_speak("become a coder")
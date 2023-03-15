=begin
 
6. Given a String S, reverse the string without reversing its individual words. Words are separated by dots.

=end

def reverse_sentence(s)
  return s.split('.').reverse.join('.')
end

p reverse_sentence("my.name.neeraj.kumar")  # "kumar.neeraj.name.my"
p reverse_sentence("Ruby.is.awesome!.!!!")  # "!!!.awesome!.is.Ruby"
p reverse_sentence("!.@.#.1.2.3.BerylSystems")  #  "BerylSystems.3.2.1.#.@.!"
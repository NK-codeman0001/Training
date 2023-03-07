=begin
Split the String into N Cases of Equal Length

Create a function that accepts str and cases as parameters where the string is split into N distinct cases of equal length as shown:
Examples

splitNCases("Strengthened", 6) ➞ ["St", "re", "ng", "th", "en", "ed"]

splitNCases("Unscrupulous", 2) ➞ ["Unscru", "pulous" ]

splitNCases("Flavorless", 1) ➞ ["Flavorless" ]

Notes

If it's not possible to split the string as described, return ["Error"].
=end


def splitNCases(str, n)
	p str, str.length, n
	s='.'
  strlen=str.length
  subgrplen=strlen/n
	if subgrplen * n  != strlen
		return ["Error"]
	end
  s=s*subgrplen
  regvar = Regexp.new s 
  return str.scan(regvar)
end


p splitNCases("Strengthened", 6) # ["St", "re", "ng", "th", "en", "ed"]

p splitNCases("Unscrupulous", 2) # ["Unscru", "pulous" ]

p splitNCases("Flavorless", 1) # ["Flavorless" ]
=begin

Unlucky Years (hard)

Create a function which returns how many Friday 13ths there are in a given year.
Examples
how_unlucky(2020) ➞ 2
how_unlucky(2026) ➞ 3
how_unlucky(2016) ➞ 1
Notes
Check Resources for some helpful tutorials on the Ruby datetime module.

=end
require 'date'

def how_unlucky(y)
	t= Date.new(y,1,13)
  fcount=0
  while(t.year<y+1)
    if t.friday?
      fcount+=1
    end
    t=t.next_month
  end
  return fcount
end	

p how_unlucky(2020) # 2
p how_unlucky(2026) # 3
p how_unlucky(2016) # 1
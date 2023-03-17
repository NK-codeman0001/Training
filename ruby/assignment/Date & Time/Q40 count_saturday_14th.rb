=begin
40. Write a function which takes year and returns how many Saturday 14ths there are in a given year.
=end


def count_saturday_14th(y)
	t= Date.new(y,1,14)
  fcount=0
  while(t.year<y+1)
    if t.saturday?
      fcount+=1
    end
    t=t.next_month
  end
  return fcount
end	

p count_saturday_14th(2020) # 2
p count_saturday_14th(2026) # 3
p count_saturday_14th(2016) # 1
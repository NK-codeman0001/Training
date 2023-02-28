=begin
  Ques=> Find the Max of 3 numbers
=end
def Max(n1,n2,n3)
  if n1>=n2 and n1>=n3
      return n1
  elsif n2>=n1 and n2>=n3
      return n2
  else 
      return n3
  end
end
puts "Enter 3 Integers:"
n1=gets.chomp()
n2=gets.chomp()
n3=gets.chomp()
puts "Max of #{n1},#{n2} and #{n3} is #{Max(n1,n2,n3)}"

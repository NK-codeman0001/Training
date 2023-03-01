=begin
  Ques=> Create a exponantial funtion
=end

def pow(base_num,pow_num)
  ans=1
  pow_num.times do |i|
      ans= ans* base_num
  end
  return ans
end

puts pow(2,5)
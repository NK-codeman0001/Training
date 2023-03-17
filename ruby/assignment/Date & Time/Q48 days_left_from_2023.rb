=begin 
48. Given a date, return how many days date is away from 2023 (end date not included). date will be in
mm/dd/yyyy format.
=end

require 'date'

def days_left_from_2023(str)
  e_date = Date.new(2023)
  date= Date.strptime(str, "%m/%d/%Y")
  if e_date < date
    return "Invalid Date"
  end
  return (e_date - date).to_i

end

p days_left_from_2023("02/2/2022")  #333
p days_left_from_2023("01/1/2023")  #0
p days_left_from_2023("12/31/2022")  #1
p days_left_from_2023("02/2/2020")  #1064
p days_left_from_2023("02/2/2023")  #"Invalid Date"

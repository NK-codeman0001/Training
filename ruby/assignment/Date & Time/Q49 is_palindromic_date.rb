=begin 
49. The 2nd of February 2020 is a palindromic date in both dd/mm/yyyy and mm/dd/yyyy format
(02/02/2020). Given a date in dd/mm/yyyy format, return true if the date is palindromic in both date
formats, otherwise return false
=end
require 'date'

def is_palindromic_date(str)
  date=Date.strptime(str,'%d/%m/%Y')
  d1 = date.strftime('%d/%m/%Y')
  d2= date.strftime('%m/%d/%Y')
  return d1==d2
end

p is_palindromic_date("2/2/2020") #true
p is_palindromic_date("17/3/2023") #true
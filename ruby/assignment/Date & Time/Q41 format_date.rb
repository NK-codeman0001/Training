=begin 

41. Create a function that converts dates from one of five string formats:
"January 9, 2019" (MM D, YYYY)
"Jan 9, 2019" (MM D, YYYY)
"01/09/2019" (MM/DD/YYYY)
"01-09-2019" (MM-DD-YYYY)
"01.09.2019" (MM.DD.YYYY)
The return value will be an array formatted like: [MM, DD, YYYY], where MM, DD, and YYYY are all integers.

=end
require 'date'

# <<<<< Solution 1 >>>>>
# def format_date(str)
#   case 
#   when str.include?('/')
#     str_date = Date.strptime(str, "%m/%d/%Y")
#   when str.include?('-')
#     str_date = Date.strptime(str, "%m-%d-%Y")
#   when str.include?('.')
#     str_date = Date.strptime(str, "%m.%d.%Y")
#   else
#     str_date = Date.parse(str)
#   end
#   return str_date.strftime('[%m, %d, %Y]')
# end

# <<<<< Solution 2 >>>>>
def format_date(str)
  case 
  when str.include?('/')
    str_date = Date.strptime(str, "%m/%d/%Y")
  when str.include?('-')
    str_date = Date.strptime(str, "%m-%d-%Y")
  when str.include?('.')
    str_date = Date.strptime(str, "%m.%d.%Y")
  else
    str_date = Date.parse(str)
  end
  return [str_date.month,str_date.day,str_date.year]
end


p format_date("January 9, 2019") # [1, 9, 2019]
p format_date("Jan 9, 2019") # [1, 9, 2019]
p format_date("01/09/2019") # [1, 9, 2019]
p format_date("01-09-2019") # [1, 9, 2019]
p format_date("01.09.2019") # [1, 9, 2019]
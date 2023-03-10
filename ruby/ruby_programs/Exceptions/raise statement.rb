=begin
~~~~~~Syntax~~~~~~

raise 
OR
raise "Error Message" 
OR
raise ExceptionType, "Error Message"
OR
raise ExceptionType, "Error Message" condition
__________________________

=end

begin  
  puts 'I am before the raise.'
  raise 'An error has occurred.'  
  puts 'I am after the raise.'  
rescue Exception => e  
  puts e  #An error has occurred.
  puts e.message  #An error has occurred.
  puts e.backtrace.inspect  #["/home/beryl/Neeraj/Training/ruby/ruby_programs/Exceptions/raise statement.rb:17:in `<main>'"]
end  
puts 'I am after the begin block.'  

=begin 
~~~~~~Syntax~~~~~~

begin 
   #.. process 
   #..raise exception
rescue 
   # .. handle error
else
   #.. executes if there is no exception
ensure 
   #.. finally ensure execution
   #.. This will always execute.
end
_____________________________
=end

begin
  # raise 'A test exception.
  puts "I'm not raising exception"
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
  # puts "Raised error message can be captured using $! variable."
  # puts $!
else
  puts "Congratulations-- no errors!"
ensure
  puts "Ensuring execution"
end


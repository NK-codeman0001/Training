=begin

~~~~~~Syntax~~~~~~
begin 
   #.. process 
   #..raise exception
rescue 
   #.. handle error 
ensure 
   #.. finally ensure execution
   #.. This will always execute.
end

=end

begin
  raise 'A test exception.'
rescue Exception => e
  puts e.message  #A test exception.
  puts e.backtrace.inspect  #["/home/beryl/Neeraj/Training/ruby/ruby_programs/Exceptions/ensure statement.rb:17:in `<main>'"]
ensure
  puts "Ensuring execution" #Ensuring execution
end
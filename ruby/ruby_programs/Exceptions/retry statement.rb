=begin 
~~~~~~Syntax~~~~~
begin
   # Exceptions raised by this code will 
   # be caught by the following rescue clause
rescue
   # This block will capture all types of exceptions
   retry  # This will move control to the beginning of begin
end
_____________________________________________________

=end

# !!!!! This Code will run for Infinite Times

count =0
begin
  puts "#{count+=1}"
  file = open("/unexistant_file")
  if file
    puts "File Opened Successfully"
  end
rescue 
  fname = "existant_file"
  retry
end

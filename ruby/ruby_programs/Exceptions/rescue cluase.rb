=begin 

~~~~~Syntax~~~~~
begin  

rescue OneTypeOfException  
# -  
rescue AnotherTypeOfException  
# -  

else  
# Other exceptions

ensure
# Always will be executed

end
_________________________________

=end

begin
  file = open("/unexistant_file")
  if file
    puts "File Opened Successfullty"
  end
rescue
  file = "Beryl Systems"  
end

print file, " == Beryl Systems", "\n"
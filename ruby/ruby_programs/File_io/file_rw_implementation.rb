File.open("/home/beryl/Neeraj/test2","r+") do |file|
    file.readline() #it will read the first line of the file and move the postion of curr pointer to nextline
    file.readchar() #it will read the first character of the file and move the postion of curr pointer to next character
    file.write("it will overwrite from the positon of curr position of the file")
    file.write("\n in this case it will overwrite from 2nd line's 2nd character")
end
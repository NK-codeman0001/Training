File.open("/home/beryl/Neeraj/test","r") do |file|
    # puts file  #it will read the meta data of file
    # puts file.read()  #it will read the content of the file
    # puts file.read().include? "ruby" #it will search the text in the file
    # puts file.readline() #it will read the first line of the file and move the postion of curr pointer to nextline
    # puts file.readline() #now it will print the second line
    # puts file.readchar() #it will read the first character of the file and move the postion of curr pointer to next character
    # puts file.readchar() #now it will print the second character
    # puts file.readlines() 

    for line in file   #line will take value of every line in the file line by line
        puts line
    end
end
#     or 
# file = File.open("/home/beryl/Neeraj/test","r")
# puts file.read()
# file.close()

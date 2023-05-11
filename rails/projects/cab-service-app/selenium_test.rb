require 'selenium-webdriver'
options = Selenium::WebDriver::Chrome::Options.new
# options.add_argument('--headless')
driver = Selenium::WebDriver.for:chrome, options: options

driver.get "http://127.0.0.1:3000/users/login"

#<-------------Credentials--------------->
title = "Test Blog Using Selenoum-Webdriver Ruby"
content = "Content Added using Selenium"
published_at = Time.now
username = 'admin.user'
password = 'changeit'
puts driver.current_url
#<-------------Login--------------->
form=driver.find_element(:css, ".p-8")
form_username = form.find_element(:id, "user_username").send_keys(username)

form_password = form.find_element(:id, "user_password").send_keys(password)

form_login = form.find_element(:name, "commit").click
 
sleep 1
puts driver.current_url
#<-------------Logout--------------->

# form_logout = form.find_element(:css, ".button_to").find_element(:tag_name,"button").click
# puts driver.current_url
# puts driver.title
# driver.navigate.refresh
# sleep 3
# driver.find_element(:tag_name,"body").send_keys "\uE00F"  //This code will use unicode to scrolldown till the body end.
# driver.action.key_down(:control).key_down('t').perform #// popen new tab (not working)
# driver.manage.window.resize_to(480,320)   #resize the window
# driver.manage.window.maximize   #resize the window
# ele = driver.find_element(:id, "gb")
# driver.action.move_to(ele).click.context_click.perform #perform right click

# driver.execute_script("alert('hello js')") #execute js code

# # Navigate to the second page
# driver.navigate.to 'https://www.selenium.dev/documentation/webdriver/actions_api/keyboard/'

# sleep 2
# # Go back to the first page
# driver.navigate.back

# sleep 2
# # Go forward to the second page again
# driver.navigate.forward

# Get the handle of the current window and print it
# puts driver.window_handle

# puts driver.capabilities

# driver.manage.new_window(:tab)
# sleep 1
# driver.manage.new_window(:tab)
# sleep 1
# driver.manage.new_window(:tab)
# sleep 1
# driver.manage.new_window(:tab)

# sleep 3

# require 'selenium-webdriver'

# # Set the options to run Chrome in headless mode
# options = Selenium::WebDriver::Chrome::Options.new
# options.add_argument('--headless')

# # Create a new WebDriver instance with the headless options
# driver = Selenium::WebDriver.for :chrome, options: options

# # Navigate to a web page and do something
# driver.get 'https://www.example.com'
# puts driver.title


# # Quit the driver and close all associated windows
# driver.quit

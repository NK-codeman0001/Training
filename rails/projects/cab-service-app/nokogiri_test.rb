require 'mechanize'
require 'nokogiri'

# set global login credentials
$username = "admin.user"
$password = "changeit"

# generate a mechanize agent object for persistent "browsing"
a = Mechanize.new

def form_login(a)
  # get the desired page with the login form
  a.get('http://127.0.0.1:3000/users/login') do |page|

    # get the value of the csrf-token meta tag
    csrf_token = page.meta['csrf-token']['content']

    # now let's dive into the form, that asks for email, password
    # and for the authenticity_token in a hidden field
    login_result = page.form_with(:action => '/users/login') do |login|

      login.field_with(:name => 'user[username]').value = $username
      login.field_with(:name => 'user[password]').value = $password
      login.field_with(:name => 'authenticity_token').value = csrf_token

      # check output in console
      puts login
      puts login.values

      # submit the form
      login.submit
    end # of login block
  end
end

form_login(a)



# require 'mechanize'
# require 'nokogiri'
# require 'open-uri'

# # set global login credentials
# $username = "admin.user"
# $password = "changeit"

# # generate a mechanize agent object for persistent "browsing"
# a = Mechanize.new #{ |agent| agent.user_agent_alias = 'Mac Safari' }

# def form_login(a)
#   # get the desired page with the login form
#   a.get('http://127.0.0.1:3000/users/login') do |page|

#     # search the current csrf-token in the head of the document
#     csrf_token = page.search('//meta[@name="csrf-token"]/@content')

#     # now let's dive into the form, that asks for email, password
#     # and for the authenticity_token in a hidden field
#     login_result = page.form_with(:action => '/users/login') do |login|

#       login.field_with(:name => 'user[username]').value = $username
#       login.field_with(:name => 'user[password]').value = $password
#       login.field_with(:name => 'authenticity_token').value = csrf_token

#       # check output in console
#       puts login
#       puts login.values

#       # submit the form
#       login.submit
#     end # of login block
#   end
# end


# form_login(a)

# require 'mechanize'

# agent = Mechanize.new
# page = agent.get('http://35.161.77.27/users/login')
# login_form = page.form_with(:action => '/users/login')
# login_form['user[username]']='admin.user'
# login_form['user[password]']='changeit'
# # csrf_token = page.at('meta[name="csrf-token"]')&.attributes&.[]('content')&.value
# # login_form['_csrf_token'] = csrf_token
# # agent.add_field('X-CSRF-Token', csrf_token)
# csrf_token = page.at('meta[name="csrf-token"]')&.attributes&.[]('content')&.value
# agent.add_header('X-CSRF-Token', csrf_token)
# # newpage = login_form.submit
# newpage = login_form.submit(nil, {'Referer' =>'http://35.161.77.27/users/login'})

# puts "<----------->"


# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'

# doc = Nokogiri::HTML4(URI.open('https://rubyonrails.org/blog/'))

# doc.css('.blog__post').each do |blog|
#   title = blog.at_css('a').text  
#   content = blog.at_css('dd').text
#   published_at = blog.at_css('h6').text
  
#   blog = Blog.where(title: title).first_or_initialize
#   blog.update(
#     content: content,
#     published_at: Time.current
#   )
  
# end

# require 'nokogiri'
# require 'open-uri'

# base_url = 'https://rubyonrails.org/blog?page=' # replace with your website's URL structure
# page_num = 1
# all_blogs = []

# while true
#   url = base_url + page_num.to_s
#   doc = Nokogiri::HTML(open(url))
  
#   # extract all blog elements from the page
#   blog_elements = doc.css('.blog')
  
#   # break out of loop if there are no more blogs on the page
#   break if blog_elements.empty?
  
#   # extract the details of each blog and add it to the list of all blogs
#   blog_elements.each do |blog|
#     title = blog.css('.title').text
#     author = blog.css('.author').text
#     content = blog.css('.content').text
    
#     all_blogs << { title: title, author: author, content: content }
#   end
  
#   page_num += 1
# end

# puts all_blogs # print all blogs

# require 'nokogiri'
# require 'open-uri'

# # Initialize the URL and page counter
# url = 'https://rubyonrails.org/blog/'
# page_count = 1

# # Loop through all pages and fetch the blog articles
# loop do
#   # Build the URL with the page number
#   url_with_page = "#{url}?page=#{page_count}"

#   # Fetch the HTML content of the page
#   html = URI.open(url_with_page)

#   # Parse the HTML content with Nokogiri
#   doc = Nokogiri::HTML(html)

#   # Find all the blog articles on the page
#   articles = doc.css('.blog__post , dd')

#   # Stop the loop if no articles were found
#   break if articles.empty?

#   # Print out the titles of each article
#   articles.each do |article|
#     title = article.css('.blog__post , a').text.strip
#     puts title
#   end

#   # Increment the page counter for the next iteration
#   page_count += 1
# end


# require 'mechanize'

# agent = Mechanize.new
# full_link="https://rubyonrails.org/blog"
# # 158 pages
# loop do
#   page = agent.get(full_link)

#   # Select all blog post titles on the current page
#   titles = page.search('.blog__post a').map(&:text)
#   blog_links = page.search('.blog__post').map{|post| post.at('a')[:href]}
  
  
#   # Print the titles
#   # puts blog_links
#   # puts titles
  
#   blog_links.each do |link|
#     # fetch the blog page
#     full_blog_link = URI.join(page.uri, link)
#     # puts "<--------Start-------->"
#     # puts link
#     # puts "<--------Mid-------->"
#     # puts full_links
#     # puts "<--------End-------->"
#     blog_page = agent.get(full_blog_link)
#     # blog_page = full_blog_link.click
  
#     # use Nokogiri to scrape the blog title, author name, and publication date
#     title = blog_page.css('h2').text.strip
#     # author = blog_page.css('h6').text.strip
#     content = blog_page.css('.common-content--post')

#     date = Date.parse(blog_page.css('.common-headline h5').text.strip)

  
#     # print the scraped information
#     puts "Title: #{title}"
#     # puts "Author: #{author}"
#     # puts "Content: #{content}"
#     puts "Publication Date: #{date}"
#     puts "\n"
#   end
  

#   # Break out of the loop if there are no more pages
#   element = page.search('.blog__pagination').first
#   break if element.nil?
#   link = element.at('a')[:href]
#   full_link = URI.join(page.uri, link).to_s

# end

# require 'mechanize'
# require 'nokogiri'

# # create a Mechanize agent
# agent = Mechanize.new

# # set the user agent to mimic a web browser
# agent.user_agent_alias = 'Mac Safari'

# # fetch the blog list page
# page = agent.get('https://rubyonrails.org/blog/')

# # find all links to individual blog pages
# blog_links = page.links_with(href: %r{/blog/\d{4}/\d{2}/\d{2}/.+})
# puts blog_links
# puts "<--------End-------->"

# iterate over each blog link and scrape the relevant information
# blog_links.each do |link|
#   # fetch the blog page
#   blog_page = link.click

#   # use Nokogiri to scrape the blog title, author name, and publication date
#   title = blog_page.css('h2').text.strip
#   author = blog_page.css('h6').text.strip
#   date = Date.parse(blog_page.css('h5').value)

#   # print the scraped information
#   puts "Title: #{title}"
#   puts "Author: #{author}"
#   puts "Publication Date: #{date}"
#   puts "\n"
# end

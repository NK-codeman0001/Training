class HomeController < ApplicationController   
  def index	
    @page_name = 'home'
    @title_text = 'Hello World!'
    @subtitle_text = 'I am learning Rails'    
  end

end
class PagesController < ApplicationController
  def about_us
    @page_name = 'about_us'
    @title_text = 'Hello World!'
    @subtitle_text = 'I am learning Rails'    
  end

  def contact_us
    @page_name = 'contact_us'
    @title_text = 'Hello World!'
    @subtitle_text = 'I am learning Rails'    
  end

  def privacy_policy
    @page_name = 'privacy_policy'
    @title_text = 'Hello World!'
    @subtitle_text = 'I am learning Rails'    
  end

  def terms_and_conditions
    @page_name = 'terms and condition'
    @title_text = 'Hello World!'
    @subtitle_text = 'I am learning Rails'    
  end
end

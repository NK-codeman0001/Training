class BlogsController < ApplicationController
  def index    
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
  
  end

  def create
  
  end

  def edit
  
  end

  def update
  
  end

  def destroy
  
  end

  private 

  def post_params
    params.require(:title,:body)
    
  end
end

class BlogsController < ApplicationController
  def index    
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
    Blog.find(params[:id]).exist?
  rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to "/#{@blog.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to "/#{@blog.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def blog_params
    params.require(:blog).permit(:title,:body)
    
  end
end

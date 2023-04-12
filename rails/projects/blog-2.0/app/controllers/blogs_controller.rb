class BlogsController < ApplicationController

  before_action :set_blog, except: [:index, :new, :create]
  def index    
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
  rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @blog.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def archive    
    @blog.toggle!(:archived)
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :show, status: :unprocessable_entity
    end

  end

  private 

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title,:body,:archived)
    
  end
end

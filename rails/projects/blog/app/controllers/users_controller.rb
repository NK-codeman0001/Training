class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :gender, :age,:address, :terms_and_conditions,:email,:email_confirmation)
    end
end

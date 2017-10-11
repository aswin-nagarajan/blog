class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User was successfully created"
      redirect_to root_path
    
    else
      render :new
    end
    
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  
end
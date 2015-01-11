class UsersController < ApplicationController
  def new
    store_location(params[:return_to])
    @user = User.new  
  end

  def create
    puts 'UsersController - create'

    @user = User.new(user_params)
    if @user.save
      puts "Save Successfully"
      redirect_back_or root_url 
    else
      puts "Save not success"
      render :new
    end 
  end

  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

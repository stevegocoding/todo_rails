class SessionsController < ApplicationController
  def new
    store_location params[:return_to]
  end
  
  def create
    login = signin_params[:login]
    @user = if login.include?('@')
              User.where('lower(email) = lower(?)', login).first
            else
              User.where('lower(username) = lower(?)', login).first
            end
    
    if @user && @user.authenticate(signin_params[:password])
      login_as @user
      remember_me if params[:remember_me]
      redirect_back_or root_url
    else
      flash.now[:warning] = 'Incorrect user name or password'
      render :new
    end
    
  end
  
  private
  
  def signin_params
    params.require(:user).permit(:login, :password)
  end
end

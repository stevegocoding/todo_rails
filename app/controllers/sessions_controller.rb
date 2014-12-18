class SessionsController < ApplicationController
  def new
    store_location params[:return_to]
    respond_to do |format|
      format.html
      format.js 
    end
  end
  
  def create
    login = signin_params[:email]
    @user = if login.include?('@')
              User.where('lower(email) = lower(?)', login).first
            else
              User.where('lower(username) = lower(?)', login).first
            end
    
    respond_to do |format|
      if @user && @user.authenticate(signin_params[:password])
        login_as @user
        remember_me if params[:remember_me]

        format.html { redirect_back_or root_url }
        format.js
      else
        error_msg = 'Incorrect user name or password'
        puts error_msg
        flash.now[:warning] = 'Incorrect user name or password'
        format.json { render json: {signin_error: error_msg} }
      end
    end
  end
  
  private
  
  def signin_params
    params.require(:user).permit(:email, :password)
  end
end

class SessionsController < ApplicationController
  def new
    store_location params[:return_to]
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
        signin_as @user
        remember_me if params[:remember_me]
        format.html { redirect_to dashboard_url }
        
        #format.json { render json: {
        #  location: url_for(controller: 'dashboard', action: 'index')
        #}}
      else
        format.json { render json: {error: 'Invalid username or password'}, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def signin_params
    params.require(:user).permit(:email, :password)
  end
  
  def check_layout
    
  end
end

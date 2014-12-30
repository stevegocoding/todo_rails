class SessionsController < ApplicationController
  def new
    store_location params[:return_to]
    respond_to do |format|
      format.html
    end
  end
  
  def create
    login = signin_params[:email]
    @user = if login.include?('@')
              User.where('lower(email) = lower(?)', login).first
            else
              User.where('lower(username) = lower(?)', login).first
            end
    
      if @user && @user.authenticate(signin_params[:password])
        # login_as @user
        remember_me if params[:remember_me]
        
        redirect_to root_url(signed_in: true)
        
      else
        error_msg = 'Incorrect user name or password'
        flash.now[:warning] = error_msg
        
        format.json { 
          render json: { sigggnin_error: error_msg }, status: 422
        }
      end
  end
  
  private
  
  def signin_params
    params.require(:user).permit(:email, :password)
  end
  
  def check_layout
    
  end
end

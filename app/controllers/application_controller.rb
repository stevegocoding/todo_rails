class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :signed_in?, :current_user
  
  def signin_required
    unless signed_in?
      redirect_to signin_path
    end
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  def store_location(path)
    session[:return_to] = path
  end
  
  def current_user
    @current_user ||= signin_from_session || signin_from_cookies unless defined?(@current_user)
    @current_user
  end
  
  def signin_as(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
  def signed_in?
    !!current_user
  end
  
  def signin_from_session
    if session[:user_id].present?
      begin 
        User.find session[:user_id]  
      rescue
        session[:user_id] = nil
      end
    end
  end
  
  def signin_from_cookies
    if cookies[:remember_token].present?
      if user = User.find_by_remmber_token(cookies[:remember_token])
        session[:user_id] = nil
        user
      else 
        forget_me
        nil
      end
    end
  end
  
  def forget_me
    cookies.delete(:remember_token)
  end
  
end

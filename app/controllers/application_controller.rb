class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def redirect_back_or_default(default)
    redirect_to(session.delete(:return_to) || default)
  end
  
  def store_location(path)
    session[:return_to] = path
  end
  
end

class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to(dashboard_url);
    end
  end
end

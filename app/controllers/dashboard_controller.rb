class DashboardController < ApplicationController
  layout 'dashboard'
  
  before_action :signin_required
  
  def index
    @tasks = current_user.tasks
  end
  
end

class DashboardController < ApplicationController
  layout 'dashboard'
  
  before_action :signin_required
  
  def index
    filter = params[:filter_id] || 'inbox'
    @filtered_tasks = current_user.tasks.send(filter)
  end
end

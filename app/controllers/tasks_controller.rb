class TasksController < ApplicationController
  def filtered
    filter = params[:filter_id] || 'inbox'
    @tasks = Task.send(filter)
    respond_to do |format| 
      format.json { render json: @tasks.to_json }
    end
  end 
end

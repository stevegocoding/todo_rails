class HomeController < ApplicationController
  def index
    puts 'hahahah'
    if params[:signed_in] 
      render layout: 'dashboard'
    end
  end
end

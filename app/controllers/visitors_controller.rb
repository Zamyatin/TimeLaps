class VisitorsController < ApplicationController
  
  def index
    @user = current_user
    render :'visitors/index'
  end
end
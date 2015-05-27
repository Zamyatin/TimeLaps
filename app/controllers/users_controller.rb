class UsersController < ApplicationController
  def index
    @users = User.all
    render "index"
  end
  
  def show
    me = current_user
    @user = User.find(me)
    render "show"
  end
end
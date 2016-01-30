class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
  end
  def follow
    redirect_to(:back)
  end
end
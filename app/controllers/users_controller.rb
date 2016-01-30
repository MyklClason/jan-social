class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
  end
  def follow
    @user.disliked_by current_user
    if @user.vote_registered?
      flash[:warning] = "You are now following that user"
    else
      flash[:info] = "You already following that user"
    end
    redirect_to(:back)
  end
end
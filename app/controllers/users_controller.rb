class UsersController < ApplicationController
  helper_method :follow, :followers_messages
  before_action :set_user, only: [:follow]

  def index
    @users = User.all
  end
  def show
  end

  def follow
    if @user == current_user:
      flash[:warning] = "You cannot follow yourself"
    else
      @user.liked_by current_user
      if @user.vote_registered?
        flash[:success] = "You are following that user"
      else
        @user.unliked_by current_user
        flash[:info] = "You are no longer following that user"
      end
    redirect_to(:back)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
class UsersController < ApplicationController
  helper_method :follow
  before_action :set_user, only: [:follow, :show]
  before_action :disabled, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end
  def show
  end

  def follow
    if @user == current_user
      flash[:warning] = "You cannot follow yourself"
    else
      @user.followed_by current_user
      if @user.vote_registered?
        flash[:success] = "You are following that user"
      else
        @user.unfollowed_by current_user
        flash[:info] = "You are no longer following that user"
      end
    end
    redirect_to(:back)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def disabled
    flash[:danger] = "That functionality is not enabled"
    redirect_to(root_path)
  end
end
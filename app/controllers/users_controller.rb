class UsersController < ApplicationController
  before_action :set_user, only: [:followings, :followers]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @nails = @user.nails.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

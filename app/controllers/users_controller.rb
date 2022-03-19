class UsersController < ApplicationController
  before_action :set_user, only: [:followings, :followers, :favorites]

  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    if params[:sort] == "new_arrival_order"
      @nail = @user.nails.page(params[:page]).order(created_at: :desc)
    elsif params[:sort] == "posting_order"
      @nail = @user.nails.page(params[:page]).order(created_at: :asc)
    elsif params[:sort] == "many_favorite"
      @nail = @user.nails.left_joins(:favorites).group(:id).order('count(favorites.nail_id) desc').page(params[:page])
    else
      @nail = @user.nails.page(params[:page]).order(created_at: :desc)
    end
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
  
  def favorites
    @user = User.find(params[:id])
    @favorite_nails = @user.favorited_nails
     if params[:sort] == "new_arrival_order"
      @favorite_nails = @user.favorited_nails.page(params[:page]).order(created_at: :desc)
     elsif params[:sort] == "posting_order"
      @favorite_nails = @user.favorited_nails.page(params[:page]).order(created_at: :asc)
     elsif params[:sort] == "many_favorite"
      @favorite_nails = @user.favorited_nails.left_joins(:favorites).group(:id).order('count(favorites.nail_id) desc').page(params[:page])
     else
      @favorite_nails = @user.favorited_nails.page(params[:page]).order(created_at: :desc)
     end
    #favorites = Favorite.where(user_id: @user.id).pluck(:nail_id)
    #@favorite_nails = Nail.find(favorites)
  end 
    

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

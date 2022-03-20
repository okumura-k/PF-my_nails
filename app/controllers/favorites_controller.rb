class FavoritesController < ApplicationController

  def create
    @nail = Nail.find(params[:nail_id])
    favorite = current_user.favorites.new(nail_id: @nail.id)
    favorite.save
  end

  def destroy
    @nail = Nail.find(params[:nail_id])
    favorite = current_user.favorites.find_by(nail_id: @nail.id)
    favorite.destroy
  end

end

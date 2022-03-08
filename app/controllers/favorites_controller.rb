class FavoritesController < ApplicationController
  
  def create
    nail = Nail.find(params[:nail_id])
    favorite = current_user.favorites.new(nail_id: nail.id)
    favorite.save
    redirect_to nail_path(nail)
  end 
  
  def destroy
  end 
end

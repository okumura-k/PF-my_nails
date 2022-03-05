class NailsController < ApplicationController

  def index
    @nails = Nail.all
  end

  def edit
  end

  def show
    @nail = Nail.find(params[:id])
  end

  def new
    @nail = Nail.new
  end

  def create
    @nail = Nail.new(nail_params)
    @nail.user_id = current_user.id
    @nail.save
    redirect_to nail_path(@nail.id)
  end
  
  def destroy
    @nail = Nail.find(params[:id])
    @nail.destroy
    redirect_to nails_path
  end 

  private
  def nail_params
    params.require(:nail).permit(:image, :introduction)
  end
end

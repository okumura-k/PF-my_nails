class NailsController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    @nails = Nail.page(params[:page])
    if params[:sort] == "new_arrival_order"
      @nails = Nail.page(params[:page]).order(created_at: :desc)
    elsif params[:sort] == "posting_order"
      @nails = Nail.page(params[:page]).order(created_at: :asc)
    elsif params[:sort] == "many_favorite"
      @nails = Nail.left_joins(:favorites).group(:id).order('count(favorites.nail_id) desc').page(params[:page])
    else
      @nails = Nail.page(params[:page]).order(created_at: :desc)
    end
  end

  def edit
    @nail = Nail.find(params[:id])
  end

  def update
    @nail = Nail.find(params[:id])
    @nail.update(nail_params)
    redirect_to nail_path(@nail.id)
  end

  def show
    @nail = Nail.find(params[:id])
    @nail_comment = NailComment.new
  end

  def new
    @nail = Nail.new
  end

  def create
    @nail = Nail.new(nail_params)
    @nail.user_id = current_user.id
    if @nail.save
     redirect_to nail_path(@nail.id)
    else
     render :new
    end
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

  def correct_user
    @nail = Nail.find(params[:id])
    @user = @nail.user
    redirect_to(nails_path) unless @user == current_user
  end
end

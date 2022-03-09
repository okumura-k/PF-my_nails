class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)
    @nail = @like.nail
    if @like.valid?
      @like.save
      redirect_to nail_path(@nail)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @nail = @like.nail
    if @like.destroy
      redirect_to nail_path(@nail)
    end
  end

  private
  def like_params
    params.permit(:nail_id)
  end
end

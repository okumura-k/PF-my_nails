class NailCommentsController < ApplicationController
  
  def create
    nail = Nail.find(params[:nail_id])
    comment = current_user.nail_comments.new(nail_comment_params)
    comment.nail_id = nail.id
    comment.save
    redirect_to nail_path(nail)
  end 
  
  def destroy
    NailComment.find(params[:id]).destroy
    redirect_to nail_path(params[:nail_id])
  end 
  
  private
  
  def nail_comment_params
    params.require(:nail_comment).permit(:comment)
  end 
  
end

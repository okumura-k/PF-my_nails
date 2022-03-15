class NailCommentsController < ApplicationController
  
  def create
    @nail = Nail.find(params[:nail_id])
    comment = current_user.nail_comments.new(nail_comment_params)
    comment.nail_id = @nail.id
    comment.save
    redirect_to request.referer
  end 
  
  def destroy
    @nail = Nail.find(params[:nail_id])
    NailComment.find(params[:id]).destroy
    redirect_to request.referer
  end 
  
  private
  
  def nail_comment_params
    params.require(:nail_comment).permit(:comment)
  end 
  
end

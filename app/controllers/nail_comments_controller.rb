class NailCommentsController < ApplicationController

  def create
    @nail = Nail.find(params[:nail_id])
    @nail_comment = current_user.nail_comments.new(nail_comment_params)
    @nail_comment.nail_id = @nail.id
    @nail_comment.save
  end

  def destroy
    @nail_comment = NailComment.find(params[:id])
    @nail_comment.destroy

  end

  private

  def nail_comment_params
    params.require(:nail_comment).permit(:comment)
  end

end

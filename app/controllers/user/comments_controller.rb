class User::CommentsController < ApplicationController
  def create
    bread = Bread.find(params[:bread_id])
    comment = current_user.comments.new(comment_params)
    comment.bread_id = bread.id

    comment.save
    # redirect_to bread_path(bread)
  end

  def destroy
    comment = Comment.find(params[:bread_id])
    bread = comment.bread

    comment.destroy
    # redirect_to bread_path(bread.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

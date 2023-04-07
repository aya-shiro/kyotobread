class User::CommentsController < ApplicationController
  def create
    bread = Bread.find(params[:bread_id])
    comment = current_user.comments.new(comment_params)
    comment.bread_id = bread.id
    comment.save
    redirect_to bread_path(bread.id)
  end

  def destroy
    Bread.find(params[:id]).destroy
    redirect_to bread_path(bread.id)

  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

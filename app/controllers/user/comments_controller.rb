class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @bread = Bread.find(params[:bread_id])
    comment = current_user.comments.new(comment_params)
    # comment.bread_id = @bread.id
    comment.save
    # redirect_to bread_path(bread)
  end

  def destroy
    Comment.find(params[:id]).destroy
    # bread = comment.bread
    @bread = Bread.find(params[:bread_id])
    # redirect_to bread_path(bread.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(bread_id: params[:bread_id])
  end
end

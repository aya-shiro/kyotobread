class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @bread = Bread.find(params[:bread_id])
    comment = current_user.comments.new(comment_params)
    comment.save
  end

  def destroy
    Comment.find(params[:id]).destroy
    @bread = Bread.find(params[:bread_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(bread_id: params[:bread_id])
  end
end

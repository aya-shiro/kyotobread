class Admin::CommentsController < ApplicationController
  def create
  end

  def destroy
    # adminでuserのコメント削除
    comment = Comment.find_by(id: params[:id], bread_id: params[:bread_id])
                            # (id: params[:コメント1つ], bread_id: params[:そのコメントが書かれている投稿1件])
    # user = Bread.find(params[:bread_id]).user
    bread = Bread.find(params[:bread_id])
           # comment.bread.user

    comment.destroy
    # redirect_to admin_user_path(user.id)
    redirect_to admin_bread_path(bread.id)
  end
end

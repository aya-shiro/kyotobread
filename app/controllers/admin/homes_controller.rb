class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @breads = Bread.active_users_breads.all.order(created_at: :desc).limit(30)
    @active_users = User.where(is_delete: false)  # 有効ユーザー数
    @feedbacks = Feedback.all.order(created_at: :desc).limit(5)
  end
end

class Admin::HomesController < ApplicationController
  def top
    @breads = Bread.all.order(created_at: :desc)
    @valid_users = User.where(is_delete: false)  # 有効ユーザー数
  end
end

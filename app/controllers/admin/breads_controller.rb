class Admin::BreadsController < ApplicationController
  before_action :authenticate_admin!

  def search
    if params[:keyword].present?
      @search_breads = Bread.active_users_breads.where('bread_name LIKE ?', "%#{params[:keyword]}%").page(params[:page]).per(100)
      @keyword = params[:keyword]
      @shops = Shop.all.order(created_at: :desc)
    else
      redirect_to root_path    # 検索窓が空白の場合root_pathに遷移
    end
  end


  def index
    @breads = Bread.active_users_breads.all.order(updated_at: :desc).page(params[:page]).per(100)
  end

  def show
    @bread = Bread.find(params[:id])
    @user = @bread.user
  end

  def destroy
    bread = Bread.find(params[:id])
    user_id = bread.user.id

    bread.destroy
    redirect_to admin_user_path(user_id)

  end
end

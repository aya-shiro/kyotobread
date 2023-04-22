class User::ShopsController < ApplicationController

  def search
    if params[:keyword].present?
      @search_shops = Shop.where('address LIKE ? OR shop_name LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%").page(params[:page]).per(20)
      # 住所もしくは店名で検索する

      @keyword = params[:keyword]

      @shops = Shop.all.order(created_at: :desc)
      @topics = Topic.all.order(created_at: :desc)
      @defaults = Drink.default.where(default_select: true)
      # views/layouts/_side.html.erbに必要な記述
    else
      redirect_to root_path    # 検索窓が空白の場合root_pathに遷移
    end
  end

  def index
    @shops = Shop.all.page(params[:page]).per(20)
  end

  def show
    @shop = Shop.find(params[:id])
    @breads = @shop.breads.all.order(created_at: :desc).page(params[:page]).per(30)
  end

  def onlines
    @shops = Shop.all.page(params[:page]).per(20)
  end
end

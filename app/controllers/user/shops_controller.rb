class User::ShopsController < ApplicationController

  def search
    if params[:keyword].present?
      # 住所もしくは店名で検索する
      @search_shops = Shop.where('address LIKE ? OR shop_name LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%").page(params[:page]).per(20)
      @keyword = params[:keyword]

      # views/layouts/_side.html.erbに必要な記述
      @shops = Shop.all.order(created_at: :desc)
      @topics = Topic.all.order(created_at: :desc)
      @default_drinks = Drink.default.where(default_select: true)
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

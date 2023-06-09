class Admin::ShopsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      flash[:notice] = "新規登録完了しました"
      redirect_to admin_shops_path
    else
      render :new
    end
  end

  def index
    @shops = Shop.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @shop = Shop.find(params[:id])
    @breads = @shop.breads.page(params[:page]).per(50)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = "編集しました"
      redirect_to admin_shop_path(@shop.id)
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    if shop.destroy
      flash[:notice] = "削除しました"
      redirect_to admin_shops_path
    end
  end


  private
  def shop_params
    params.require(:shop).permit(:shop_name, :postcode, :address, :nearest_station, :shop_url, :online_url)
  end

end

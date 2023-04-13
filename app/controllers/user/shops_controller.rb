class User::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @breads = @shop.breads
  end

  def onlines
    @shops = Shop.all
  end
end

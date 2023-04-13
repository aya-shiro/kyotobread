class User::ShopsController < ApplicationController
  def index
  end

  def show
    @shop = Shop.find(params[:id])
    @breads = @shop.breads
  end
end

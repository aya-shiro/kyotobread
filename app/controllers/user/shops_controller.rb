class User::ShopsController < ApplicationController
  def index
  end

  def show
    @shop = Shop.find(params[:id])
    @breads = @shop.breads
  end

  def onlines
    # @onlines = Shop.where(:online_url)
  end
end

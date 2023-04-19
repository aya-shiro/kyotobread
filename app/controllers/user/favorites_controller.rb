class User::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @bread = Bread.find(params[:bread_id])
    favorite = current_user.favorites.new(bread_id: @bread.id)
    favorite.save
    # redirect_to bread_path(bread.id)
  end

  def destroy
    @bread = Bread.find(params[:bread_id])
    favorite = current_user.favorites.find_by(bread_id: @bread.id)
    favorite.destroy
    # redirect_to bread_path(bread.id)
  end

  def show
    @favorites = current_user.favorites.includes(:bread)
    # current_userの、Breadモデルのデータを含むfavorites(つまりいいね)を取得する。
  end
end

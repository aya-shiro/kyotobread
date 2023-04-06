class User::FavoritesController < ApplicationController

  def create
    bread = Bread.find(params[:bread_id])
    favorite = current_user.favorites.new(bread_id: bread.id)
    favorite.save
    redirect_to bread_path(bread.id)
  end

  def destroy
    bread = Bread.find(params[:bread_id])
    favorite = current_user.favorites.find_by(bread_id: bread.id)
    favorite.destroy
    redirect_to bread_path(bread.id)
  end
end

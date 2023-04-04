class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @breads = Bread.all
    @bread = @user.bread
  end

  def destroy
  end
end

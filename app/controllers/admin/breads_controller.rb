class Admin::BreadsController < ApplicationController
  def index
  end

  def show
    # @bread = Bread.find_by(id: params[:id])
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

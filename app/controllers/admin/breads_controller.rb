class Admin::BreadsController < ApplicationController
  def index
  end

  def show
    # @bread = Bread.find_by(id: params[:id])
    @bread = Bread.find(params[:id])
    @user = @bread.user
  end

  def destroy
  end
end

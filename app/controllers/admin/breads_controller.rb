class Admin::BreadsController < ApplicationController
  def index
  end

  def show
    # @bread = Bread.find_by(id: params[:id])
    @bread = Bread.find(params[:id])
  end

  def destroy
  end
end

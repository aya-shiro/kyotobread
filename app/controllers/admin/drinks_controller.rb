class Admin::DrinksController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = "追加登録が完了しました"
      redirect_to admin_drinks_path
    end
  end

  def index
    @drink = Drink.new
    @drinks = Drink.all
  end

  def edit
  end

  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    redirect_to admin_drinks_path
  end


  private
  def drink_params
    params.require(:drink).permit(:drink_name, :drink_image)
  end

end

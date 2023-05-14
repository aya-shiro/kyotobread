class Admin::DrinksController < ApplicationController
  before_action :authenticate_admin!

  def new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = "追加登録が完了しました"
      redirect_to admin_drinks_path
    else
      @drinks = Drink.all
      render :index
    end
  end

  def index
    @drink = Drink.new
    @drinks = Drink.all
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    drink = Drink.find(params[:id])
    drink.update(drink_params)
    redirect_to admin_drinks_path
  end

  def destroy
  end


  private
  def drink_params
    params.require(:drink).permit(:drink_name)
  end

end

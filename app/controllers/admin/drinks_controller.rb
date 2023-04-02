class Admin::DrinksController < ApplicationController
  def new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = "新規登録完了しました"
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
  end


  private
  def drink_params
    params.require(:drink).permit(:drink_name, :drink_image)
  end

end

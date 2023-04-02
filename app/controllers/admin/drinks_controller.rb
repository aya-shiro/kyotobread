class Admin::DrinksController < ApplicationController
  def new
  end

  def create
    @drink = Drink.new(drink_params)
    @drink.save
    redirect_to request.referer
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
    params.require(:drink).permit(:drink)
  end

end

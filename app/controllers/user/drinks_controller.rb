class User::DrinksController < ApplicationController
  def index
    # @drink = Drink.find(params[:drink][:drink_name])

    @coffee = Drink.where('drink_name LIKE ?', "%#{params[:drink_name]}%").find_by(drink_name: 'コーヒー')
    # @coffee = Drink.where(drink_name: "コーヒー")
  end
end

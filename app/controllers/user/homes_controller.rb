class User::HomesController < ApplicationController
  def top
    @breads = Bread.all.order(created_at: :desc)
    @shops = Shop.all.order(created_at: :desc)
    @topics = Topic.all.order(created_at: :desc)

    @coffee = Drink.find_by(drink_name: "コーヒー")
    @tea = Drink.find_by(drink_name: "紅茶")
    @milk = Drink.find_by(drink_name: "牛乳")
    @tya = Drink.find_by(drink_name: "お茶")

    @sweet_breads = Bread.where(taste: true)
    @solty_breads = Bread.where(taste: false)
  end


end


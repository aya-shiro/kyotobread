class User::HomesController < ApplicationController
  def top
    @breads = Bread.all.order(created_at: :desc)
    @shops = Shop.all.order(created_at: :desc)
    @topics = Topic.all.order(created_at: :desc)

    @coffee = Drink.find_by(drink_name: "コーヒー")
    @tea = Drink.find_by(drink_name: "紅茶")
    @milk = Drink.find_by(drink_name: "牛乳")
    @tya = Drink.find_by(drink_name: "お茶")

    @sweet_breads = @breads.where(taste: true)
    @salty_breads = @breads.where(taste: false)

    # 過去一週間のいいね順に並べる
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @favorite_breads = Bread.includes(:favorited_users).
      sort_by {|x|
        x.favorited_users.includes(:favorites).where(created_at: from...to).size
      }.reverse
  end


end


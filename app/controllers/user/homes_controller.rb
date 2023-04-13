class User::HomesController < ApplicationController
  def top
    @breads = Bread.all.order(created_at: :desc)
    @shops = Shop.all.order(created_at: :desc)
    @topics = Topic.all.order(created_at: :desc)

    @defaults = Drink.default.where(default_select: true)

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


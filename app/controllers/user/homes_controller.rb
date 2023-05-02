class User::HomesController < ApplicationController
  def top
    @breads = Bread.active_users_breads.all.order(created_at: :desc).page(params[:page]).per(20)
    @sweet_breads = @breads.where(taste: true).page(params[:page]).per(20)
    @salty_breads = @breads.where(taste: false).page(params[:page]).per(20)

    # 過去一週間のいいね順
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @favorite_breads = Bread.active_users_breads.includes(:favorited_users)
      .sort_by {|x|
        x.favorited_users.includes(:favorites).where(created_at: from...to).size
      }.reverse
    # いいね順のページネーション記述
    @favorite_breads = Kaminari.paginate_array(@favorite_breads).page(params[:page]).per(20)

    # views/layouts/_side.html.erbに必要な記述
    @shops = Shop.all.order(created_at: :desc)
    @topics = Topic.all.order(created_at: :desc)
    @default_drinks = Drink.default.where(default_select: true)
  end


end


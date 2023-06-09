class User::BreadsController < ApplicationController
  before_action :authenticate_user!, except: %i[search index show]

  def search
    if params[:keyword].present?
      @search_breads = Bread.active_users_breads.where('bread_name LIKE ?', "%#{params[:keyword]}%").page(params[:page]).per(20)
      @keyword = params[:keyword]
    else
      redirect_to root_path    # 検索窓が空白の場合root_pathに遷移
    end
  end

  def index
    return redirect_to root_path unless params[:drink_id]    # breads/new再リロード時のエラー回避
    @drink = Drink.find_by(id: params[:drink_id])
    @breads = @drink.breads.active_users_breads.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    # 例外処理、削除された投稿はアクセス不可
    begin
      @bread = Bread.find(params[:id])
      @user = @bread.user
      @comment = Comment.new
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def new
    @bread = Bread.new
  end

  def create
    @bread = Bread.new(bread_params)
    @bread.user_id = current_user.id

    if params[:bread][:drink_name] == "other"
      drink_id = params[:bread][:other_drink_name]
    else
      drink_id = params[:bread][:drink_name]
    end

    drink = Drink.find_by(id: drink_id)
    @bread.drink_id = drink.id

    unless @bread.save
      render "user/breads/error.js.erb"
    else
      redirect_to bread_path(@bread.id)
    end
  end

  def edit
    @bread = Bread.find(params[:id])
  end

  def update
    @bread = Bread.find(params[:id])

    if params[:bread][:drink_name] == "other"
      drink_id = params[:bread][:other_drink_name]
    else
      drink_id = params[:bread][:drink_name]
    end

    drink = Drink.find(drink_id)

    @bread.drink = drink

    unless @bread.update(bread_params)
      render 'user/breads/error.js.erb'
    else
      flash[:notice] = "投稿を編集しました"
      redirect_to bread_path
    end
  end

  def destroy
    bread = Bread.find(params[:id])
    bread.destroy
    redirect_to user_path(current_user)
  end


  private
  def bread_params
    params.require(:bread).permit(:bread_name, :introduce, :taste, :bread_image, :shop_id, drink_attributes: [:drink_name, :other_drink_name])
  end


end

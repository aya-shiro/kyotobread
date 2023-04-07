class User::BreadsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @breads = @user.bread
  end

  def show
    @bread = Bread.find(params[:id])
    @user = @bread.user
    @comment = Comment.new
  end

  def new
    @bread = Bread.new
  end

  def create
    @bread = Bread.new(bread_params)
    @bread.user_id = current_user.id
    @drink = Drink.find_by(drink_name: params[:bread][:drink_name])
    # @bread.drink = @drink  #@drinkを@breadと一緒にsaveできるようにする
    if params[:bread][:drink_name] == "1"
      @drink.drink_name = "coffee"
    elsif params[:bread][:drink_name] == "2"
      @drink.drink_name = "tea"
    elsif params[:bread][:drink_name] == "3"
      @drink.drink_name = "milk1"
    elsif params[:bread][:drink_name] == "4"
      @drink.drink_name = "milk2"
    elsif params[:bread][:drink_name] == "5"
      @drink.drink_name = "tya"
    else
      @drink = Drink.find(params[:id])
    end

    if @bread.save
      redirect_to user_path(current_user)
    end
  end

  def edit
    @bread = Bread.find(params[:id])
  end

  def update
    @bread = Bread.find(params[:id])
    if @bread.update(bread_params)
      redirect_to bread_path
    end
  end

  def destroy
    bread = Bread.find(params[:id])
    bread.destroy
    redirect_to users_mypage_path

  end


  private
  def bread_params
    params.require(:bread).permit(:bread_name, :introduce, :taste, :bread_image, :shop_id, drink_attributes: [:drink_name])
  end


end

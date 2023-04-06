class User::BreadsController < ApplicationController
  def index
    @user = current_user
    @breads = Bread.all
  end

  def show
    @bread = Bread.find(params[:id])
  end

  def new
    @bread = Bread.new
  end

  def create
    @bread = Bread.new(bread_params)
    @bread.user_id = current_user.id
    @drink = Drink.find_by(drink_name: params[:bread][:drink_name])
    # @drink = Drink.find_or_create_by(drink_name: params[:bread][:drink_name])

    @bread.drink = @drink  #@drinkを@breadと一緒にsaveできるようにする

    if @bread.save
      redirect_to users_mypage_path
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

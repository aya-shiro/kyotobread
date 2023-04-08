class User::BreadsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @breads = @user.bread
  end

  def show
    @bread = Bread.find(params[:id])
    @user = @bread.user
    @comment = Comment.new
    # @drink = Drink.find(params[:drink_id])
  end

  def new
    @bread = Bread.new
  end

  def create
    @bread = Bread.new(bread_params)
    @bread.user_id = current_user.id
    @drink = Drink.find_by(drink_name: params[:bread][:drink_name])
    if params[:bread][:drink_name] == "1"
      # @drink.drink_name = "coffee"
      @drink = Drink.new(drink_name: "coffee")
    elsif params[:bread][:drink_name] == "2"
      @drink = Drink.new(drink_name: "tea")
    elsif params[:bread][:drink_name] == "3"
      @drink = Drink.new(drink_name: "milk")
    elsif params[:bread][:drink_name] == "4"
      @drink = Drink.new(drink_name: "tya")
    else
      @drink = Drink.new(params[:drink_name])
      # @drink.drink_name = "other"
    end

    @bread.drink = @drink
     # @bread.drink = @drink  #@drinkを@breadと一緒にsaveできるようにする

    if @bread.save
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
    if @bread.update(bread_params)
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

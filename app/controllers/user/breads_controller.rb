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
    @bread.save
    redirect_to users_mypage_path
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
    params.require(:bread).permit(:bread_name, :introduce, :taste, :bread_image, :drink_id, :shop_id)
  end



end

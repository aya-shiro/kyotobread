class User::BreadsController < ApplicationController
  def index
  end

  def show
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
  end

  def destroy
  end


  private
  def bread_params
    params.require(:bread).permit(:bread, :introduce, :taste, :bread_image, :drink_id)
  end



end

class User::UsersController < ApplicationController
  def index
  end

  def show
    @breads = current_user.bread
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to users_mypage_path
    end
  end

  def destroy
  end


  private
  def user_params
    params.require(:user).permit(:name, :user_info, :user_image)
  end

end

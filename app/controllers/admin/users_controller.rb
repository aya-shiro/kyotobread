class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @breads = @user.bread.all
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    # params[:user][:is_delete] == "false"
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました"
      redirect_to admin_user_path(@user.id)
    else
      redirect_to request.referer
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:is_delete)
  end

end

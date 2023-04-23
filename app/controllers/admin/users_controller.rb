class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @breads = @user.breads.all.order(updated_at: :desc).page(params[:page]).per(50)  # 更新日順に
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
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

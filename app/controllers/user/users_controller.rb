class User::UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @breads = @user.bread.all.order(created_at: :desc)  #マイページの投稿一覧を新着順に

  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    # if @user.update(user_params)
    #   redirect_to user_path(@user.id)
    # else
    #   render :edit
    # end
    unless @user.update(user_params)
      render "user/breads/error.js.erb"
    else
      redirect_to user_path(@user.id)
    end
  end

  def check
    @user = current_user
  end

  def withdraw    #退会処理(ステータスの更新)
    @user = current_user
    if params[:user][:agreement] == "1"
      @user.update(is_delete: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    else
      flash.now[:alert] = "退会には「上記に同意する」へのチェックが必要です"
      @user = current_user
      render :check
    end
  end

  def destroy
  end


  private
  def user_params
    params.require(:user).permit(:name, :user_info, :user_image, :agreement)
  end

end
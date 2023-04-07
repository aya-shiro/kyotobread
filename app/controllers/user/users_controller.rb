class User::UsersController < ApplicationController
  def index
    @users = User.all
    
    @my_breads = current_user.bread
    @my_breads_with_count = @my_breads.left_joins(:favorites).select('breads.*, COUNT(favorites.id) AS favorites_count').group('breads.id')
    # いいね総カウント
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
    if @user.update(user_params)
      redirect_to users_mypage_path
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

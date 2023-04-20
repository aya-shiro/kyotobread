# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]


  def guest_sign_in
    # user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    user = User.guest
    sign_in user
    redirect_to root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  protected
  # 退会しているかを判断するメソッド
  def user_state
    @user = User.find_by(email: params[:user][:email])     #入力されたemailからアカウントを1件取得

    return if !@user  #@userが取得できなかった場合はそこで終了(returnで切る)
    if @user.valid_password?(params[:user][:password]) && @user.is_delete   #@userが取得できた場合、passwordが取得したemailのアカウントと一致しているかか確認
    # else
      flash[:alert] = "メールアドレスとパスワードが一致しません"
      redirect_to new_user_registration_path
    end
  end




  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

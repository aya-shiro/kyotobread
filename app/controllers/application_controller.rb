class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :ensure_admin_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])    #sign_up時にnameとemailのデータを取得許可する
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_registration_path
    else
      root_path
    end
  end
end

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_header_data

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])    #sign_up時にnameとemailのデータを取得許可する
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
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
      root_path
    else
      root_path
    end
  end


  private

  def set_header_data  #_user-headerで使用
    @shops = Shop.all.order(created_at: :desc)
    @topics = Topic.all.order(created_at: :desc)
    @default_drinks = Drink.default.where(default_select: true)
  end

end

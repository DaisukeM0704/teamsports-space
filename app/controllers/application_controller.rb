class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday,
      :birthplace_id, :hobby_1, :hobby_2, :hobby_3, :profile, :member_id, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:member_id, :password, :remember_me])
  end
end

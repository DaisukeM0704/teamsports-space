# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:team_page, :edit, :update]
  before_action :configure_permitted_parameters
  before_action :authenticate_user!, except: :index
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  
  def index 
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to team_page_path
    else
      render :new
    end
  end

  def team_page
    @team = current_team
    @user = current_user
  end
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :first_name, :last_name, :first_name_kana, :last_name_kana, :hobby_1, :hobby_2, :hobby_3, :user_profile,
       :birthday, :birthplace_id, :experience_id, :member_id, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :hobby_1, :hobby_2, :hobby_3, :user_profile,
      :birthday, :birthplace_id, :experience_id, :member_id, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :hobby_1, :hobby_2, :hobby_3, :user_profile,
      :birthday, :birthplace_id, :experience_id, :member_id, :password, :password_confirmation])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    team_page_path
  end

  def after_update_path_for(resource)
    team_page_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

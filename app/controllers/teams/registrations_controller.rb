# frozen_string_literal: true

class Teams::RegistrationsController < Devise::RegistrationsController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :team_page]
  before_action :configure_permitted_parameters
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  def index
    @teams = Team.all
  end

  # GET /resource/sign_up
  def new
    @team = Team.new
  end

  # POST /resource
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_page_path
    else
      render :new
    end
  end
  
  def team_page
  end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
    if @team.update(team_params)
      redirect_to team_page_path
    else
      render :edit
    end
  end

  # DELETE /resource
  def destroy
    @team.destroy
    redirect_to root_path
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  def team_params
    params.require(:team).permit(:image, :representative_first_name, :representative_last_name, :representative_first_name_kana, :representative_last_name_kana,
      :team_name, :team_cord, :team_profile, :sports_type_id, :password, :password_confirmation)
  end
  
  def set_team
    @team = Team.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :representative_first_name, :representative_last_name, :representative_first_name_kana, :representative_last_name_kana,
      :team_name, :team_cord, :team_profile, :sports_type_id, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :representative_first_name, :representative_last_name, :representative_first_name_kana, :representative_last_name_kana,
  #      :team_name, :team_cord, :team_profile, :sports_type_id])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

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

# frozen_string_literal: true

class Teams::SessionsController < Devise::SessionsController
  before_action :set_team, only: [:destroy]
  before_action :configure_permitted_parameters
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    redirect_to team_page_path
  end

  # POST /resource/sign_in
  def create
    redirect_to team_page_path
  end
  
  def team_page
  end

  # DELETE /resource/sign_out
  def destroy
    @team.destroy
    redirect_to root_path
  end
  
  private

  def set_team
    @team = Team.find(params[:id])
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:team_cord, :password, :remember_me])
  end

  def after_sign_in_path_for(resource)
    team_page_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

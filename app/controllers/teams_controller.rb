class TeamsController < ApplicationController
  def index
  end

  def edit
    
  end

  def update
    if current_team.update(team_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def team_params
    params.require(:team).permit(:representative_first_name, :representative_last_name, :birthplace_id, :team_name, :team_id)
  end
end

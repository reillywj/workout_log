class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]
  before_action :require_admin, only: [:index]
  before_action :require_team_user_coach_or_admin, only: [:edit, :update]
  before_action :require_team_user_or_admin, only: [:show]
  def index
    set_teams
  end

  def show
  end

  def show_user_team
    if logged_in? and current_user.role != "Admin"
      @team = current_user.team
      render :show
    elsif logged_in?
      set_teams
      render :index
    else
      redirect_to new_team_path
    end
  end

  def new
    @team = Team.new
    @team.users << User.new
  end

  def create
    @team = Team.new(team_params)
    @team.users << User.new(params.require(:user).permit(:name, :email, :password, :role))
    if @team.save
      flash[:success] = "Team created!"
      user = User.where(email: params[:user][:email]).first
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid."
      render :new
    end
  end

  def edit; end

  def update
    if @team.update(team_params)
      flash[:success] = "Team info updated."
      redirect_to team_path(@team)
    else
      flash[:alert] = "Invalid update attempt."
      render :edit
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, :location, :time_zone)
  end

  def set_team
    @team = Team.find_by(slug: params[:id])
  end

  def require_admin
    unless logged_in? and current_user.role == "Admin"
      error_message
    end
  end
  def require_team_user_or_admin
    error_message unless logged_in? and (current_user.team == @team or current_user.role == "Admin")
  end

  def require_team_user_coach_or_admin
    error_message unless logged_in? and (current_user.role == "Admin" or (current_user.role == "Coach" and current_user.team == @team))
  end

  def error_message
    flash[:alert] = "You cannot do that."
    redirect_to root_path
  end

  def set_teams
    @teams = Team.all.sort do |x,y|
      x.name <=> y.name
    end
  end
end
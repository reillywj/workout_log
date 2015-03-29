class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user_or_admin, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.team = current_user.team
    if @user.save
      flash[:success] = "User created!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid update."
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User profile updated."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid update attempt."
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end

  def set_user
    @user = User.find_by(slug: params[:id])
  end

  def require_same_user_or_admin
    unless (current_user == @user) || (current_user.role == "Admin")
      error_message
    end
  end

  def error_message
    flash[:alert] = "You cannot do that."
    redirect_to root_path
  end
end
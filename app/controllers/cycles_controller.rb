class CyclesController < ApplicationController
  before_action :set_cycle, only: [:show, :edit, :update, :destroy]
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]
  before_action :user_must_be_logged_in_the_user_the_coach_or_admin, only: [:new, :create, :edit, :update]
  def show
  end

  def new
  end

  def create
    @cycle_form.submit(cycle_params)
    if @cycle_form.save
      flash[:success] = "Cycle created successfully."
      redirect_to user_cycle_path(@cycle.user, @cycle)
    else
      flash[:alert] = "Invalid submission."
      render :new
    end
  end

  def edit
  end

  def update
    @cycle_form.submit(cycle_params)
    if @cycle_form.save
      flash[:success] = "Cycle updated."
      redirect_to user_cycle_path(@cycle.user, @cycle)
    else
      flash[:alert] = "Invalid submission."
      render :edit
    end
  end


  private
  def set_cycle
    @cycle = Cycle.find(params[:id])
  end
  def cycle_params
    params.require(:cycle).permit(:length_of_time, :length_of_time_units, :description, :start_date, workouts_attributes: [:id, :date, :am_pm])
  end
  def create_new_form
    user = User.find(params[:user_id])
    @cycle = Cycle.new(length_of_time: 4, length_of_time_units: "weeks")
    @cycle.user = user
    @cycle_form = CycleForm.new(@cycle)
  end
  def create_edit_form
    @cycle_form = CycleForm.new(@cycle)
  end
  def user_must_be_logged_in_the_user_the_coach_or_admin
    unless logged_in? and (current_user.role == "Admin" or current_user == @cycle.user or current_user.role == "Coach")
      error_message
    end
  end
  def error_message
    flash[:alert] = "Access denied."
    redirect_to root_path
  end
end
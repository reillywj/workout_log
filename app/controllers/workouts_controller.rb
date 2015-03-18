class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update, :destroy]
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]
  
  def new
  end

  def create
    @workout_form.submit(workout_params)
    if @workout_form.save
      flash[:success] = "Workout created."
      redirect_to user_cycle_path(@workout.cycle.user, @workout.cycle)
    else
      flash[:alert] = "Invalid submission."
      render :edit
    end
  end

  def edit
  end  

  def update
    @workout_form.submit(workout_params)
    if @workout_form.save
      flash[:success] = "Workout for #{@workout.date} updated."
      redirect_to user_cycle_path(@workout.cycle.user, @workout.cycle)
    else
      flash[:alert] = "Invalid submission."
      render :edit
    end
  end

  private
  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    binding.pry
    params.require(:workout).permit(:date, :am_pm, workout_exercises_attributes: [:id, :order, :quick_note, :exercise_id, :_destroy, workout_sets_attributes: [:id, :weight_or_duration, :amount, :relative_perceived_exertion, :work_units, :amount_units, :completion, :_destroy]])
  end

  def create_new_form
    @workout = Workout.new
    @workout.cycle = Cycle.find(params[:cycle_id])

    @workout_form = WorkoutForm.new(@workout)
  end

  def create_edit_form
    @workout_form = WorkoutForm.new(@workout)
  end
end
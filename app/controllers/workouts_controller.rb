class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.create(workout_params)
    if @workout
      redirect_to @workout
    else
      render :new
    end
  end

  def show
    find_workout
    redirect_if_not_a_user
  end


  private

  def workout_params
    params.require(:workout).permit(:date_workedout, :description, exercise_ids:[], exercises_attributes: [:name, :upper_body?, :lower_body?, :cardio?])
  end

  def find_workout
    @workout = Workout.find_by(id: params[:id])
  end

end

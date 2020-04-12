class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
    @workout.exercises.build
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save!
      redirect_to workout_path(@workout)
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
    params.require(:workout).permit(:date_workedout, :description, exercise_ids: [], exercises_attributes: [:name, :upper_body?, :lower_body?, :cardio?, :user_id])
  end

  def find_workout
    @workout = Workout.find_by(id: params[:id])
  end

end

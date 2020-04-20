class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
    5.times do
      routines = @workout.routines.build
      routines.build_exercise
    end
  end
 
  def create
    @workout = current_user.workouts.create(workout_params)
    if @workout
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
    params.require(:workout).permit(:date, :duration, :description, routines_attributes: [:caption, :exercise_id, exercise_attributes: [:name, :category, :user_id]])
  end

  def find_workout
    @workout = Workout.all.includes(:exercises).find_by(id: params[:id])
  end

end
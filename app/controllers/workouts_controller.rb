class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
    3.times do
      routines = @workout.routines.build
      routines.build_exercise
    end
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
    params.require(:workout).permit(:date, :duration, :description, exercise_ids: [], routines_attributes: [:caption, exercise_attributes: [:name, :category, :user_id]])
  end

  def find_workout
    @workout = Workout.all.includes(:exercises).find_by(id: params[:id])
  end

end
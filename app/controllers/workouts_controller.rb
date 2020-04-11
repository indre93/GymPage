class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
   # @workout.build_exercise
  end

  def create
    
  end

  def show
    find_workout
    redirect_if_not_a_user
  end


  private

  def workout_params
    params.require(:workout).permit(:date_workedout, :description)
  end

  def find_workout
    @workout = Workout.find_by(id: params[:id])
  end

end

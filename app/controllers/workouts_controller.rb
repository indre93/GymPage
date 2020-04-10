class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
   # @workout.build_exercise
  end

  def create
    
  end

  private

  def workout_params
    params.require(:workout).permit(:date_workedout, :description)
  end

end

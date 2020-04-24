class RoutinesController < ApplicationController

  def index
    @exercise = Exercise.find_by(id: params[:exercise_id])
    if params[:exercise_id] && @exercise
      @routines = @exercise.routines
    else 
      @routines = Routine.all.includes(:workout, :exercise)
    end
  end

end

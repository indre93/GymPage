class RoutinesController < ApplicationController

  def index
    exercise = Exercise.find_by(id: params[:exercise_id])
    if exercise
      @routines = exercise.routines
    else
      @routines = Routine.all.includes(:workout, :exercise)
    end
  end

  def new
  end

  def create
  end

  private 

  def routine_params
    params.require(:routine).permit(:caption)
  end

end

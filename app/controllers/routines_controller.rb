class RoutinesController < ApplicationController
   before_action :require_login

   def index
      @exercise = Exercise.find_by(id: params[:exercise_id])
      if params[:exercise_id] && @exercise
         @routines = @exercise.routines
      else
         @error = "Exercise was not found." if params[:exercise_id]
         @routines = Routine.all.includes(:workout, :exercise)
      end
   end

   def new 
      find_workout
      if @workout && @workout.user == current_user
         @routine = @workout.routines.build
      else
         flash[:error] = "Sorry! workout was not found. Please try again."
         redirect_to user_path(current_user)
      end
   end

   def create
      find_workout
      @routine = @workout.routines.build(routine_params)
      if @routine.save
         flash[:message] = "Successfully added routine!"
         redirect_to workout_path(@routine.workout)
      else
         render :new
      end
   end

   private

   def routine_params
      params.require(:routine).permit(:caption, :workout_id, :exercise_id, exercise_attributes: [:name, :category])
   end

   def find_workout
      @workout = Workout.find_by(id: params[:workout_id])
   end

end

class RoutinesController < ApplicationController
   before_action :require_login
   before_action :find_workout, only: [:new, :create]

   def index
      @exercise = Exercise.find_by(id: params[:exercise_id])
      if params[:exercise_id] && @exercise
         @routines = @exercise.routines.by_created_at
      else
         @error = "Exercise was not found." if params[:exercise_id]
         @routines = Routine.by_created_at.includes(:workout, :exercise)
      end
   end

   def new 
      if @workout && @workout.user == current_user
         @routine = @workout.routines.build
         @routine.build_exercise
      else
         flash[:error] = "Sorry! workout was not found. Please try again."
         redirect_to user_path(current_user)
      end
   end

   def create
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
      params.require(:routine).permit(:caption, :workout_id, :exercise_id, 
         exercise_attributes: [
            :name, 
            :category
         ]
      )
   end

   def find_workout
      @workout = Workout.find_by(id: params[:workout_id])
   end

end

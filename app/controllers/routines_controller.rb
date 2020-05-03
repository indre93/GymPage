class RoutinesController < ApplicationController
   before_action :set_workout, only: [:new, :create]

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
      if @workout && current_users_workout?
         @routine = @workout.routines.build
         @routine.build_exercise
      else
         flash[:error] = "Sorry! You cannot make changes to someone else's workout"
         redirect_to user_path(current_user)
      end
   end

   def create
      @routine = @workout.routines.build(routine_params)
      if @routine.save
         flash[:message] = "Routine was successfully added!"
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

   def set_workout
      if @workout = Workout.find_by(id: params[:workout_id])
         @workout
      else
         flash[:error] = "Sorry! this workout does not exist."
         redirect_to user_path(current_user)
      end 
   end

end

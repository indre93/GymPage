class RoutinesController < ApplicationController
   before_action :require_login

   def index
   @exercise = Exercise.find_by(id: params[:exercise_id])
   if params[:exercise_id] && @exercise
      @routines = @exercise.routines
   else 
      @routines = Routine.all.includes(:workout, :exercise)
      end
   end

   def new 
      find_workout
      if @workout && @workout.user == current_user
         @routine = @workout.routines.build
         @routine.build_exercise
      else
         flash[:error] = "Sorry! We were unable to find this workout. Please try again."
         redirect_to user_path(current_user)
      end
   end

   def create
      find_workout
      @routine = @workout.routines.build(routine_params)
      if @routine.save
         flash[:message] = "Routine was successfully added!"
         redirect_to workout_path(@routine.workout)
      else
         flash[:error] = "Unable to add routine. #{@routine.errors.full_messages.to_sentence}"
         redirect_to action: :new
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

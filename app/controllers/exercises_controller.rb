class ExercisesController < ApplicationController

   def index
      @exercises = Exercise.by_created_at
   end

   def show
      if @exercise = Exercise.find_by(id: params[:id])
         @exercise
      else
         flash[:error] = "Sorry! this exercise does not exist"
         redirect_to user_path(current_user)
      end
   end

end

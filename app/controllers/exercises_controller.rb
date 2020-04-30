class ExercisesController < ApplicationController
   before_action :require_login

   def index
      @exercises = Exercise.by_created_at
   end

   def show
      @exercise = Exercise.find_by(id: params[:id])
   end

end

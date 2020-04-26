class ExercisesController < ApplicationController
   before_action :require_login

   def index
      @exercises = Exercise.all
   end

   def show
      @exercise = Exercise.find_by(id: params[:id])
   end

end

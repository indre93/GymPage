class WorkoutsController < ApplicationController
   before_action :require_login

   def index
      @workouts = Workout.all.includes(:user)
   end

   def new
      @workout = Workout.new
      3.times do
         routines = @workout.routines.build
         routines.build_exercise
      end
   end

   def create
      @workout = current_user.workouts.build(workout_params)
      if @workout.save
         flash[:message] = "Successfully added workout!"
         redirect_to workout_path(@workout)
      else
         flash[:error] = "Unable to add workout. #{@workout.errors.full_messages.to_sentence}"
         redirect_to action: :new
      end
   end

   def show
      @workout = Workout.all.includes(:exercises).find_by(id: params[:id])
   end

   private

   def workout_params
      params.require(:workout).permit(:date, :duration, :description, routines_attributes: [:caption, :exercise_id, exercise_attributes: [:name, :category]])
   end

end
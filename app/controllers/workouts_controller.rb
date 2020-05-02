class WorkoutsController < ApplicationController
   before_action :require_login
   before_action :set_workout, only: [:show, :edit, :update, :destroy]

   def index
      @recent_workouts = Workout.recently_created.includes(:user)
   end

   def new
      @workout = Workout.new
      2.times do
         routines = @workout.routines.build
         routines.build_exercise
      end
   end

   def create
      @workout = current_user.workouts.build(workout_params)
      if @workout.save
         flash[:message] = "Workout was successfully created!"
         redirect_to @workout
      else
         render :new
      end
   end

   def show
   end

   def edit
      if !current_users_workout?
         flash[:error] = "Sorry! You cannot make changes to someone else's workout"
         redirect_to user_path(current_user)
      end
   end

   def update
      if @workout.update(workout_params)
         flash[:message] = "Workout was successfully updated."
         redirect_to @workout
      else
         render :new
      end
   end

   def destroy
      @workout.destroy
      flash[:message] = "Workout was successfully deleted."
      redirect_to user_path(current_user)
   end

   private

   def workout_params
      params.require(:workout).permit(:date, :duration, :description, 
         routines_attributes: [
            :caption,
            :exercise_id,
            :id, :_destroy,
            exercise_attributes: [
               :name, 
               :category
            ]
         ]
      )
   end

   def set_workout
      @workout = Workout.includes(:exercises).find_by(id: params[:id])
   end

end
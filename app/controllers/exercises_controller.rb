class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all.includes(:user)
    redirect_if_not_a_user
  end

  def new 
    @exercise = Exercise.new
  end

  def create
    @exercise = current_user.created_exercises.build(exercise_params)
    if @exercise.save
      flash[:message] = "Exercise has been successfully added!"
      redirect_to exercise_path(@exercise)
    else
      flash[:error] = "Unable to add exercise: #{@exercise.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def show
    find_exercise
    redirect_if_not_a_user
  end

  private
  
  def exercise_params
    params.require(:exercise).permit(:name, :category)
  end
  
  def find_exercise
    @exercise = Exercise.find_by(id: params[:id])
  end

end

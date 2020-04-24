module RoutinesHelper

  def routine_exercise(routine)
    routine.exercise.name
  end

  def exercise_category(routine)
    routine.exercise.category
  end

  def user_username(routine)
    routine.workout.user.username
  end

  def user_routine(routine)
    routine.workout.user
  end

end

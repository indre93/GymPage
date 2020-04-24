module RoutinesHelper

  def routine_exercise(routine)
    routine.exercise.name
  end

  def user_username(routine)
    routine.workout.user.username
  end

  def user_routine(routine)
    routine.workout.user
  end

end

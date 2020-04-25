module RoutinesHelper

  def routine_exercise_name(routine)
    routine.exercise.name
  end

  def routine_exercise_category(routine)
    routine.exercise.category
  end
 
  def routine_username(routine)
    routine.workout.user.username
  end

  def routine_user(routine)
    routine.workout.user
  end

end

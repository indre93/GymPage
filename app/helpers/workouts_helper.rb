module WorkoutsHelper

  def workout_date(workout)
    new_date = workout.date
    new_date.strftime("%A, %B #{new_date.day.ordinalize}")
  end

end

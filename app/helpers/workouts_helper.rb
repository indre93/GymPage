module WorkoutsHelper

   def workout_date(workout)
      new_date = workout.date
      new_date.strftime("%A, %B #{new_date.day.ordinalize}")
   end

   def workout_posted_at(workout)
      date = workout.created_at
      date.strftime("%A, %B #{date.day.ordinalize} at %-I:%M%P")
   end

   def workout_username(workout)
      workout.user.username
   end

end

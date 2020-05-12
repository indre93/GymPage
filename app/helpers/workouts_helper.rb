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

   def current_users_workout_link_options(workout)
      if current_users_workout?
         content = tag.p(link_to("Add Another Routine to this Workout", new_workout_routine_path(workout)))
         content << tag.p(link_to("Edit Workout", edit_workout_path(workout)))
         content << tag.p(link_to("Delete Workout", workout_path(workout), method: :delete, data: { confirm: "Are you sure you want to delete this workout?" }))
      end
   end

end

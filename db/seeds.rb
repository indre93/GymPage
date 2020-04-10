# Users:
katie = User.create!(first_name: "Katie", last_name: "Johnson", email: "katie@email.com", password: "password")
john = User.create!(first_name: "John", last_name: "Smith", email: "john@email.com", password: "password")

# Workout: 
katie.workouts.create!(date_workedout: "04/10/2020", description: "Today's workout consisted of a little bit of everything")
john.workouts.create!(date_workedout: "04/09/2020", description: "Simple cardio day. Decided to take a day off from weight lifting.")

# Exercises:
Exercise.create!(
    [
      { name: "Planks", upper_body?: true, lower_body?: true, cardio?: false, user_id: 1, workout_id: 1 },
      { name: "Bench Press", upper_body?: true, lower_body?: false, cardio?: false, user_id: 1, workout_id: 1 },
      { name: "Pull-up", upper_body?: true, lower_body?: false, cardio?: false, user_id: 1, workout_id: 1 },
      { name: "Treadmill", upper_body?: true, lower_body?: true, cardio?: true, user_id: 1, workout_id: 1 },
      { name: "Squat", upper_body?: true, lower_body?: true, cardio?: false, user_id: 1, workout_id: 1 },
      { name: "Treadmill", upper_body?: true, lower_body?: true, cardio?: true, user_id: 2, workout_id: 2 },
      { name: "Jumping Jacks", upper_body?: true, lower_body?: true, cardio?: true, user_id: 2, workout_id: 2 }
    ]
  )

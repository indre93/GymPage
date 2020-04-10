# Users:
katie = User.create(first_name: "Katie", last_name: "Johnson", email: "katie@email.com", password: "password")
john = User.create(first_name: "John", last_name: "Smith", email: "john@email.com", password: "password")

# Workout: 
katies_workout = katie.workouts.create(date_workedout: "04/10/2020", description: "Today's workout consisted of a little bit of everything")
johns_workout = john.workouts.create(date_workedout: "04/09/2020", description: "Simple cardio day. Decided to take a day off from weight lifting.")

# Exercises:
katies_exercises = katies_workout.exercises.create(
    [
      { name: "Planks", upper_body?: true, lower_body?: true, cardio?: false },
      { name: "Bench Press", upper_body?: true, lower_body?: false, cardio?: false },
      { name: "Pull-up", upper_body?: true, lower_body?: false, cardio?: false },
      { name: "Treadmill", upper_body?: true, lower_body?: true, cardio?: true },
      { name: "Squat", upper_body?: true, lower_body?: true, cardio?: false }
    ]
  )

johns_exercises = johns_workout.exercises.create(
    [
      { name: "Treadmill", upper_body?: true, lower_body?: true, cardio?: true },
      { name: "Jumping Jacks", upper_body?: true, lower_body?: true, cardio?: true }
    ]
  )

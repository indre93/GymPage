# Users:
katie = User.create!(first_name: "Katie", last_name: "Johnson", email: "katie@email.com", password: "password")
john = User.create!(first_name: "John", last_name: "Smith", email: "john@email.com", password: "password")

#katie.workouts.create!(date_workedout: "04/10/2020", description: "Today's workout consisted of a little bit of everything")
#john.workouts.create!(date_workedout: "04/09/2020", description: "Simple cardio day. Decided to take a day off from weight lifting.")

# Exercises:
Exercise.create!(
  [
    { name: "Overhead Press", category: "Upper Body Training", user_id: 1 },
    { name: "Bench Press", category: "Upper Body Training", user_id: 1 },
    { name: "Lateral Raise", category: "Upper Body Training", user_id: 1 },
    { name: "Dumbbell Triceps Extension", category: "Upper Body Training", user_id: 1 },

    { name: "Barbell Back Squats", category: "Lower Body Training", user_id: 1 },
    { name: "Romanian Deadlifts", category: "Lower Body Training", user_id: 1 },
    { name: "Bulgarian Split Squats", category: "Lower Body Training", user_id: 1 },
    { name: "Glute Ham Raise", category: "Lower Body Training", user_id: 1 },

    { name: "Leg Adduction", category: "Resistance Training", user_id: 1 },
    { name: "Plank", category: "Resistance Training", user_id: 2 },
    { name: "Side Plank", category: "Resistance Training", user_id: 2 },
    { name: "Straight Leg Raises", category: "Resistance Training", user_id: 1 },

    { name: "Squat Jumps", category: "Cardiovascular Training", user_id: 2 },
    { name: "Jump Rope", category: "Cardiovascular Training", user_id: 2 },
    { name: "Jumping Jacks", category: "Cardiovascular Training", user_id: 2 },
    { name: "Burpees", category: "Cardiovascular Training", user_id: 2 },

    { name: "Standing Hamstring Stretch", category: "Flexibility Training", user_id: 1 },
    { name: "Lunge With Spinal Twist", category: "Flexibility Training", user_id: 2 },
    { name: "Figure Four Stretch", category: "Flexibility Training", user_id: 2 },
    { name: "Triceps Stretch", category: "Flexibility Training", user_id: 2 },
  ]
)

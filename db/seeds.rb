# Users:
katie = User.create!(username: "Katiejohnson", email: "katie@email.com", password: "password")
john = User.create!(username: "Johnny90", email: "john@email.com", password: "password")

# Workouts:
katies_workout = katie.workouts.create!(date: "10/04/2020", duration: "2 hours", description: "Today's workout consisted of a little bit of everything")
johns_workout = john.workouts.create!(date: "09/04/2020", duration: "1 hour and 30 minutes", description: "Simple cardio day. Decided to take a day off from weight lifting.")

# Exercises:
Exercise.create!(
  [
    { name: "Overhead Press", category: "Upper Body Training"},
    { name: "Bench Press", category: "Upper Body Training"},
    { name: "Lateral Raise", category: "Upper Body Training"},
    { name: "Dumbbell Triceps Extension", category: "Upper Body Training"},

    { name: "Barbell Back Squats", category: "Lower Body Training"},
    { name: "Romanian Deadlifts", category: "Lower Body Training"},
    { name: "Bulgarian Split Squats", category: "Lower Body Training"},
    { name: "Glute Ham Raise", category: "Lower Body Training"},

    { name: "Leg Adduction", category: "Resistance Training"},
    { name: "Plank", category: "Resistance Training"},
    { name: "Side Plank", category: "Resistance Training"},
    { name: "Straight Leg Raises", category: "Resistance Training"},

    { name: "Squat Jumps", category: "Cardiovascular Training"},
    { name: "Jump Rope", category: "Cardiovascular Training"},
    { name: "Jumping Jacks", category: "Cardiovascular Training"},
    { name: "Burpees", category: "Cardiovascular Training"},

    { name: "Standing Hamstring Stretch", category: "Flexibility Training"},
    { name: "Lunge With Spinal Twist", category: "Flexibility Training"},
    { name: "Figure Four Stretch", category: "Flexibility Training"},
    { name: "Triceps Stretch", category: "Flexibility Training"},
  ]
)

# Routines:
Routine.create!(
  [
    {caption: "3 sets / 10 reps", workout_id: 1, exercise_id: 1},
    {caption: "5 sets / 5 reps", workout_id: 1, exercise_id: 2},
    {caption: "3 sets / 10 reps", workout_id: 1, exercise_id: 3},
    {caption: "2 sets / 15 reps", workout_id: 1, exercise_id: 4},

    {caption: "3 sets / 10 reps", workout_id: 1, exercise_id: 5},
    {caption: "3 sets / 5 reps", workout_id: 1, exercise_id: 6},
    {caption: "3 sets / 15 reps", workout_id: 1, exercise_id: 7},
    {caption: "5 sets / 10 reps", workout_id: 1, exercise_id: 8},

    {caption: "3 sets / 10 reps", workout_id: 1, exercise_id: 9},
    {caption: "3 sets of 2 minutes", workout_id: 2, exercise_id: 10},
    {caption: "3 sets of one minute", workout_id: 2, exercise_id: 11},
    {caption: "5 sets of 15", workout_id: 1, exercise_id: 12},

    {caption: "5 sets / 10 reps", workout_id: 2, exercise_id: 13},
    {caption: "Did it for 5 minutes", workout_id: 2, exercise_id: 14},
    {caption: "5 sets / 10 reps", workout_id: 2, exercise_id: 15},
    {caption: "3 sets of 5 reps", workout_id: 2, exercise_id: 16},

    {caption: "Spent at least 5 minutes doing this, or at least tried to!", workout_id: 1, exercise_id: 17},
    {caption: "Tried this new movement!", workout_id: 2, exercise_id: 18},
    {caption: "First time trying this and loved it!", workout_id: 2, exercise_id: 19},
    {caption: "Definitely felt yesterdays workout while doing this", workout_id: 2, exercise_id: 20},
  ]
)

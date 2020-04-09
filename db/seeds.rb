# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users:

katie = User.create(first_name: "Katie", last_name: "Johnson", email: "katie@email.com", password: "password")
john = User.create(first_name: "John", last_name: "Smith", email: "john@email.com", password: "password")

# Workouts:

katie.workouts.create(name: "Planks", description: "3 sets of 2 minutes", upper_body?: true, lower_body?: true)

katie.workouts.create(name: "Squats", description: "5 sets of 10 reps - 180 pounds", upper_body?: true, lower_body?: true)

john.workouts.create(name: "Push-Ups", description: "3 sets / 15 reps", upper_body?: true, lower_body?: true)
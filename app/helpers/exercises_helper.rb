module ExercisesHelper

  def category_options
    ["Upper Body Training", "Lower Body Training", "Cardiovascular Training", "Resistance Training", "Flexibility Training"]
  end

  def formatted_created_at(exercise)
    date = exercise.created_at
    date.strftime("%A, %B #{date.day.ordinalize} at %-I:%M %p")
  end
  
end

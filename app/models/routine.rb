class Routine < ApplicationRecord
   belongs_to :workout
   belongs_to :exercise
   
   scope :by_created_at, -> { order("created_at desc") }

   validates :caption, presence: true
   validates_associated :exercise
   validates_uniqueness_of :exercise_id, :scope => :workout_id
   
   def exercise_attributes=(attributes)
      if self.exercise_id
         exercise = Exercise.find_by_id(self.exercise_id)
         self.exercise = exercise
      else !attributes.values.any?(&:empty?)
         exercise = Exercise.find_or_create_by(attributes)
         self.exercise = exercise
      end
   end

end

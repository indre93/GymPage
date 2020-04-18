class Routine < ApplicationRecord
  belongs_to :user
  belongs_to :workout
  belongs_to :exercise

  validates :caption, presence: true

  def exercise_attributes=(attributes)
    if !attributes.values.any?(&:empty?)
      self.exercise = Exercise.find_or_create_by(attributes) 
    end
  end
  
end

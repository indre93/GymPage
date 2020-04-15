class Workout < ApplicationRecord
  belongs_to :user
  has_many :routines
  has_many :exercises, through: :routines

  validates :date, :description, :duration, presence: true

  def exercises_attributes=(attributes)
    attributes.values.each do |value| 
      if !value["name"].blank? && !value["category"].blank?
        self.exercises << Exercise.find_or_create_by(value) 
      end
    end
  end

end
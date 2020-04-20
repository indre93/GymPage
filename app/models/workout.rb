class Workout < ApplicationRecord
  belongs_to :user
  has_many :routines, dependent: :destroy
  has_many :exercises, through: :routines
  accepts_nested_attributes_for :routines, reject_if: :reject_routines
 
  validates :date, :description, :duration, presence: true

  def reject_routines(routine_params)
    routine_params.values.any?(&:empty?) && (routine_params["exercise_attributes"].values.any?(&:empty?) || !routine_params["exercise_id"])
  end	 

#  def routines_attributes=(attributes)
#    attributes.values.each do |routine_params|  
#      if !routine_params.values.any?(&:empty?)
#        self.routines << Routine.create(routine_params)    
#      end
#    end 
#  end
  
end
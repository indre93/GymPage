class Workout < ApplicationRecord
   belongs_to :user
   has_many :routines, dependent: :destroy
   has_many :exercises, through: :routines
   accepts_nested_attributes_for :routines, allow_destroy: true, reject_if: :reject_routines

   scope :recently_created, -> (limit = 10) { order("created_at desc").limit(limit) }
   scope :by_completion_date, -> { order("date desc") }

   validates :date, :description, :duration, presence: true

   def reject_routines(routine_params)
      routine_params.values.any?(&:empty?) && !exercise_exist?(routine_params)
   end

   def exercise_exist?(routine_params)
      !routine_params["exercise_attributes"].values.any?(&:empty?) || !!routine_params["exercise_id"]
   end

end

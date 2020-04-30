class Workout < ApplicationRecord
   belongs_to :user
   has_many :routines, dependent: :destroy
   has_many :exercises, through: :routines
   accepts_nested_attributes_for :routines, reject_if: :reject_routines

   validates :date, :description, :duration, presence: true

   scope :recently_created, -> (limit = 10) { order("created_at desc").limit(limit) }
   scope :by_completion_date, -> { order("date desc") }

   def reject_routines(routine_params)
      routine_params.values.any?(&:empty?) && !exercise_exist?
   end

   def execise_exist?
      !routine_params["exercise_attributes"].values.any?(&:empty?) || !!routine_params["exercise_id"]
   end

end
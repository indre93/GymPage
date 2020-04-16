class Workout < ApplicationRecord
  belongs_to :user
  has_many :routines
  has_many :exercises, through: :routines
  accepts_nested_attributes_for :routines, reject_if: :reject_routines

  validates :date, :description, :duration, presence: true

  # Writer method that creates each routine and builds an exercise off of it
  # routine_params = {"caption"=>"3 sets of 15", "exercise_attributes"=>{"name"=>"Push-Up", "category"=>"Resistance Training", "user_id"=>"3"}}

  def reject_routines(routine_params)
    routine_params["caption"].empty? && routine_params["exercise_attributes"].values.any?(&:empty?)
  end

end
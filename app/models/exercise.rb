class Exercise < ApplicationRecord
  belongs_to :user
  has_many :routines
  has_many :workouts, through: :routines

  validates :name, :category, presence: true
  validates :name, uniqueness: true
end

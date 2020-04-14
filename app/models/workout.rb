class Workout < ApplicationRecord
  belongs_to :user
  has_many :routines
  has_many :exercises, through: :routines

  validates :date, :description, :duration, presence: true
  validates :date, uniqueness: true
  
end
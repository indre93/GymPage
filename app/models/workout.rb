class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :comments
  has_many :users, through: :comments
end

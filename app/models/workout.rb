class Workout < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :exercises
  has_many :users, through: :comments

  #accepts_nested_attributes_for :exercise
end

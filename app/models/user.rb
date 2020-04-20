class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :created_exercises, foreign_key: "user_id", class_name: "Exercise"
  has_many :exercises, through: :workouts
  has_many :routines, through: :workouts

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  before_save { self.email = email.downcase }

end

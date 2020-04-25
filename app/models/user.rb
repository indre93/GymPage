class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :exercises, through: :workouts
  has_many :routines, through: :workouts

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  before_save { self.email = email.downcase }
  
end

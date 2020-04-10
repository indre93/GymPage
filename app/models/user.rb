class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  has_many :comments
  has_many :exercises, through: :workouts
  has_many :comments, through: :workouts

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  before_save { self.email = email.downcase }

end

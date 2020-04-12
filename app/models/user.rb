class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  has_many :created_exercises, foreign_key: "user_id", class_name: "Exercise"
  has_many :exercises, through: :workouts # has many completed exercises

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  before_save { self.email = email.downcase }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end

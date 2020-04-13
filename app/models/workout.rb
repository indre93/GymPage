class Workout < ApplicationRecord
  belongs_to :user
  has_many :routines
  has_many :exercises, through: :routines

  validates :date, :description, :duration, presence: true
  validates :date, uniqueness: true

  def formatted_date
    @date = self.date
    @date.strftime("%A, %B #{@date.day.ordinalize}")
  end
end
class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :users, through: :exercises


  def formatted_date
    @date = self.date_workedout
    @date.strftime("%A, %B #{@date.day.ordinalize}")
  end
end
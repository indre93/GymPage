class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :name, presence: true
  validates :name, uniqueness: true
end

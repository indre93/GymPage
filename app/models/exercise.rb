class Exercise < ApplicationRecord
   has_many :routines
   has_many :workouts, through: :routines

   validates :name, :category, presence: true
   validates :name, uniqueness: true

   scope :by_created_at, -> { order("created_at desc") }
   scope :by_name, -> { order("name asc") }

end

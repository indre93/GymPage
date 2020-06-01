class Exercise < ApplicationRecord
   has_many :routines
   has_many :workouts, through: :routines
   
   scope :by_created_at, -> { order("created_at desc") }
   scope :by_name, -> { order("name asc") }
   scope :by_name_length, -> { order("length(name) desc").limit(1) }

   validates :name, :category, presence: true
   validates :name, uniqueness: true

end

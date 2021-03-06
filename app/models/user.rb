class User < ApplicationRecord
   has_secure_password
   has_many :workouts, dependent: :destroy
   has_many :exercises, through: :workouts
   has_many :routines, through: :workouts

   validates :username, :email, presence: true
   validates :username, :email, uniqueness: true
   validates :password, confirmation: true
   
   before_save { self.email = email.downcase }
   before_save { self.username = username.parameterize(separator: '_') }

   def self.from_omniauth(auth)
      self.find_or_create_by(email: auth.info.email) do |user|
         user.username = auth.info.name
         user.email = auth.info.email
         user.password = SecureRandom.hex(10)
      end
   end

end

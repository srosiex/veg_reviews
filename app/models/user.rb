class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_meals, through: :reviews, source: :meal

    has_many :meals
    validates :username, uniqueness: true, presence: true
    has_secure_password

    def self.google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
    end
end
end

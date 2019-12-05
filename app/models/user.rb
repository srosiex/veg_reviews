class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_meals, through: :reviews, source: :meal

    has_many :meals
    validates :username, uniqueness: true, presence: true
    has_secure_password
end

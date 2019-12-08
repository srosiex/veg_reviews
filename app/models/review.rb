class Review < ApplicationRecord
    belongs_to :user
    belongs_to :meal

    validates :title, presence: true
    validates :content, presence: true

    validates :meal, uniqueness: { scope: :user, message: "Meal has already been created." }
    


end
class Review < ApplicationRecord
    belongs_to :user
    belongs_to :meal

    validates :title, presence: true
    
end
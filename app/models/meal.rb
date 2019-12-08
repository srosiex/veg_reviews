class Meal < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :restaurant

  validates :name, presence: true
  validates :description, presence: true


  scope :grouped_ratings, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.alphabetical_order
    order(:name)
  end

  # def restaurant_attributes=(attributes)
  #   restaurant = Restaurant.find_or_create_by(attributes) if !attribute['name'].empty?
  # end

  def not_a_duplicate
    if Meal.find_by(name: name, restaurant_id: restaurant_id)
      errors.add(:name, 'has already been added for that brand')
  end 
end

  def name_and_restaurant
    "#{name} - #{restaurant.name}"
  end

end

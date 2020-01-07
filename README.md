Review
Stars
Title
Content
Meal_id
User_id
Belongs_to :meal
Belongs_to :user

User
Username
Email
Password
Has_many reviews
Has_many meals

Meal
Description
Has_many :reviews
Has_many :users, through :reviews
Belongs_to :restaurant

Restaurant
Name
All_vegan :boolean
Has_many :meals
Meal_id
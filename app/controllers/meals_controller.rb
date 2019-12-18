class MealsController < ApplicationController
    before_action :authenticate
    def index
        authenticate
        @meals = Meal.grouped_ratings
    end

    def new

        @meal = Meal.new
        @meal.build_restaurant
    end

    def create
        @meal = Meal.new(meal_params)
        @meal.user_id = session[:user_id]
        if @meal.save
            redirect_to meal_path(@meal)
        else
            @meal.build_restaurant
            render :new
        end
    end

    def ratings
        authenticate
        @meals = Meal.grouped_ratings
    end

private

def meal_params
    params.require(:meal).permit(:name, :description, :restaurant_id, restaurant_attributes: [:name])
end

end

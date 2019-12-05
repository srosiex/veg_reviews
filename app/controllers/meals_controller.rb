class MealsController < ApplicationController

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
            render :new
        end
    end

private

def meal_params
    params.require(:meal).permit(:name, :description, :restaurant_id, restaurant_attributes: [:name, :all_vegan])
end

end

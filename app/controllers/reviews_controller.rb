class ReviewsController < ApplicationController
    
    def index
        if @meal = Meal.find_by_id(params[:meal])
        @reviews = @meal.reviews.all
        else
            @reviews = Review.all
        end
    end
    
    def new
        if @meal = Meal.find_by_id(params[:meal_id])
        @review = @meal.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:meal_id, :content, :stars, :title)
    end

end

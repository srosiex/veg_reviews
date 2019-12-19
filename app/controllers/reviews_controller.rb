class ReviewsController < ApplicationController

    before_action :authenticate
    skip_before_action :authenticate, only: [:index]
    def index
        authenticate
        if @meal = Meal.find_by_id(params[:meal])
        @reviews = @meal.reviews.all
        else
            @reviews = Review.all
        end
    end
    
    def new
        authenticate
        if @meal = Meal.find_by_id(params[:meal_id])
        @review = @meal.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        authenticate
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        authenticate
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:meal_id, :content, :stars, :title)
    end



end

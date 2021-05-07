class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        if @vehicle = Vehicle.find_by_id(params[:vehicle_id])
            @review = @vehicle.reviews.build
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

    def index
        if @vehicle = Vehicle.find_by_id(params[:vehicle_id])
            @reviews = @vehicle.reviews 
        else
            @reviews = Review.all
        end
    end

    private

    def review_params
        params.require(:review).permit(:vehicle_id, :rating, :content)
    end
end

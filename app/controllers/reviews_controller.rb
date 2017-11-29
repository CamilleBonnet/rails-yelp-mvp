class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :show, :destroy, :update]
  before_action :set_restaurant, only: [:index, :create, :new]

  def index
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @review.update(review_params)
    id = @review.restaurant_id
    if @review.save
      redirect_to restaurant_path(id)
    else
      render :edit
    end
  end

  def destroy
    id = @review.restaurant_id
    @review.destroy
      redirect_to restaurant_path(id)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

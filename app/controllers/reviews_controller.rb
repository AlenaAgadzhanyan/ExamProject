class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    @other_reviews = Review.where(user_name: @review.user_name).where.not(id: @review.id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:perfomance_id, :user_name, :rating, :review_text, :review_date)
  end
end
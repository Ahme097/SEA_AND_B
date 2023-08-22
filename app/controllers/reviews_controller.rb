class ReviewsController < ApplicationController
  def new
    @yacht = Yacht.find(params[:yacht_id])
    @review = Review.new
  end

  def show
    @reviews = Reviews.all
  end

  def create
    @yacht = Yacht.find(params[:yacht_id])
    if @review.save
      redirect_to yacht_path(@yacht), notice: "Review was successfully created."
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

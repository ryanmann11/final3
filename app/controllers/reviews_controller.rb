class ReviewsController < ApplicationController
  before_action :find_case

  def new
    @review = Review.new
  end

  def create
    review_params = params.require(:review).permit(:body, :rating)
    @review = @case.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @case, notice: "Thanks for the review!"
    else
      render "new"
    end
  end

  def find_case
    @case = Case.find_by(id: params["case_id"])
  end

end

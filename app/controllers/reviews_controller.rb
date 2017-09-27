class ReviewsController < ApplicationController
  before_action :find_review, only: :destroy

  attr_reader :review

  def create
    review = Review.new review_params
    if review.save
      flash[:success] = t "review.success"
    else
      flash[:danger] = t "review.fail"
    end
    response_result
  end

  def update
    if review.update_attributes review_params
      flash[:success] = t "review.update_success"
    else
      flash[:danger] = t "review.update_fail"
    end
    response_result
  end

  def destroy
    if review.destroy
      flash[:success] = t "review.delete_success"
    else
      flash[:danger] = t "review.delete_fail"
    end
    response_result
  end

  private

  def find_review
    @review = Review.find_by id: params[:id]

    return if review
    flash[:danger] = t "review.not_found"
    redirect_to :back
  end

  def response_result
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end

  def review_params
    params.require(:review).permit :user_id, :book_id, :content
  end
end

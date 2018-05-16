class ReviewsController < ApplicationController
  before_action :find_review, only: %i(update destroy)
  before_action :signed_in_user, :find_product, only: %i(create update destroy)

  def create
    @review = Review.new review_params
    if @review.save
      flash[:success] = t "reviews.create_success"
    else
      flash[:danger] = t "reviews.create_fail"
    end
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = t "reviews.update_success"
    else
      flash[:danger] = t "reviews.update_fail"
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = t "reviews.delete_success"
    else
      flash[:danger] = t "reviews.delete_fail"
    end
  end

  private
  def review_params
    params.require(:review).permit :rating, :content, :user_id, :product_id
  end

  def find_review
    @review = Review.find_by id: params[:id]
    return if @review

    flash[:danger] = t "reviews.not_found"
    redirect_to root_path
  end

  def find_product
    @product = Product.find_by(id: params[:review]) || Product.find_by(id: params[:review][:product_id])
    return if @product
    flash[:danger] = t "reviews.not_found"
    redirect_to root_path
  end
end

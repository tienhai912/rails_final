class PromotionsController < ApplicationController
  before_action :find_promotion, only: %i(show)

  def index
    @promotions = Promotion.all
  end

  def show
    @products = @promotion.products
  end

  private
  def find_promotion
    @promotion = Promotion.find_by id: params[:id]

    return if @promotion
    flash[:danger] = t "promotions.not_found"
    redirect_to :back
  end
end

class ProductsController < ApplicationController
  before_action :load_support, only: :index
  before_action :find_product, only: :show

  attr_reader :product

  def index; end

  def show
    @order_item = current_order.order_items.new
  end

  private
  def find_product
    @product = Product.find_by id: params[:id]

    return if product
    flash[:danger] = t "products.not_found"
    redirect_to :back
  end

  def load_support
    @products_support = Supports::ProductSupport
      .new products: Product.all, param: params
  end
end

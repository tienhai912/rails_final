class CartsController < ApplicationController
  def show
    @order_item = current_order.order_items
  end
end

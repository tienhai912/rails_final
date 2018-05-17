class OrderItemsController < ApplicationController
  before_action :signed_in_user, only: %i(create show delete)

  def create
    @order = current_order
    valid_order
    @order_items = @order.order_items.find_by(product_id: order_item_params[:product_id])
    if @order_items.blank?
      @order_items = @order.order_items.new(order_item_params)
      @order_items.save
    else
      params[:order_item][:quantity] = (order_item_params[:quantity].to_i + @order_items.quantity).to_s
      @order_items.update_attributes(order_item_params)
    end
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    @order.save
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    @order.save
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def valid_order
    return if current_order.valid?

    @order.user_id = current_user.id
    @order.active = true
  end
end

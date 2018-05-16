class OrdersController < ApplicationController
  before_action :find_order, only: %i(show)
  before_action :signed_in_user, only: %i(index show)

  def index
    @orders_list = current_user.orders.order(created_at: :desc)
    @orders = @orders_list.page(params[:page]).per_page Settings.orders.show_limit
  end

  def show
  end

  def create
    current_order.save!
    session.delete :order_id
    flash[:success] = t "common.thank_buy"
    redirect_to root_path
  end

  private

  def find_order
    @order = Order.find_by id: params[:id]
    render_not_found unless @order
  end
end

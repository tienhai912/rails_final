class OrdersController < ApplicationController
  before_action :find_order, only: %i(show)
  before_action :signed_in_user, only: %i(index show)

  def index
    @orders = Order.find_by(user_id: current_user.id).order(created_at: :desc)
  end

  def show
  end

  private

  def find_order
    @order = Order.find_by id: params[:id]
    render_not_found unless order
  end
end

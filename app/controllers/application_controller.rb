class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def render_not_found
    render file: Rails.root.join("public", "404.html"),
      status: :not_found
  end

  def signed_in_user
    return if user_signed_in?
    flash[:danger] = t "common.please_sign_in"
    redirect_to new_user_session_path
  end

  def current_order
    if !session[:order_id].blank?
      Order.find_by id: session[:order_id]
    else
      Order.new
    end
  end
end

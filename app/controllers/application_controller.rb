class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_not_found
    render file: Rails.root.join("public", "404.html"),
      status: :not_found
  end

  private
  def signed_in_user
    return if user_signed_in?
    store_location
    flash[:danger] = t "please_sign_in"
    redirect_to new_user_session_path
  end
end

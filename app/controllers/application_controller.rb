class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def render_not_found
    render file: Rails.root.join("public", "404.html"),
      status: :not_found
  end
end

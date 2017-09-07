Rails.application.routes.draw do
  scope "/:locale" do
    devise_for :users
    root "static_pages#home"
  end
end

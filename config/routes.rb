Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks,
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"} do
      delete "sign_out", to: "devise/sessions#destroy",
        as: :destroy_user_session
  end
  scope "/(:locale)" do
    devise_for :users, skip: :omniauth_callbacks
    root "static_pages#home"
  end
end

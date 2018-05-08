Rails.application.routes.draw do

  devise_for :users, only: :omniauth_callbacks,
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"} do
      delete "sign_out", to: "devise/sessions#destroy",
        as: :destroy_user_session
  end

  devise_for :users, skip: :omniauth_callbacks
  # resources :users, only: %i(show)
  root "static_pages#home"

end

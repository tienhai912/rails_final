Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, only: :omniauth_callbacks,
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"} do
      delete "sign_out", to: "devise/sessions#destroy",
        as: :destroy_user_session
  end
  devise_for :users, only: :registrations,
    controllers: {registrations: "users/registrations"}
  devise_for :users, skip: %i(omniauth_callbacks registrations)
  resources :users, only: %i(show)
  resources :products, only: %i(index show)
  resources :orders, only: %i(index show)
  root "static_pages#home"

end

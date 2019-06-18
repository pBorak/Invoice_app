Rails.application.routes.draw do
  resources :invoices, except: [:edit, :update]
  devise_for :users

  authenticated :user do
    root 'invoices#index', as: :authenticated_root
  end

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  root 'home#index'
end

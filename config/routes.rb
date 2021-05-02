Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root 'tops#index'

  resources :users, only: [:show, :update]
end

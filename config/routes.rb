Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root 'tops#index'

  resources :users, only: [:show, :update] do
    get :post_list, on: :member
  end

  resources :posts
end

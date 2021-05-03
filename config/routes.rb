Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root 'tops#index'
  get :dynamic_select_category, to: 'posts#dynamic_select_category'

  resources :users, only: [:show, :update] do
    get :post_list, on: :member
  end

  resources :posts
end

Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' }
  root 'tops#index'
  get 'sitemap', to: redirect('https://s3-ap-northeast-1.amazonaws.com/keiken/sitemaps/sitemap.xml.gz')
  get :dynamic_select_category, to: 'posts#dynamic_select_category'
  get '/search', to: 'posts#search', as: :search
  get '/search_header', to: 'posts#search_header', as: :search_header
  get '/kiyaku', to: 'operations#kiyaku', as: :kiyaku
  get '/privacy', to: 'operations#privacy', as: :privacy
  put "/users/:id/withdrawal" => "users#withdrawal", as: 'withdrawal'
  get '/registration_complete', to: 'operations#registration_complete', as: :registration_complete
  get '/anounce', to: 'operations#anounce', as: :anounce

  resources :users, only: [:show, :update] do
    get :post_list, on: :member
    get :mypage, on: :member
  end

  resources :posts do
    resources :likes, only: %i(create destroy)
    resources :answers do
      resources :comments, only: [:create]
    end
  end
  resources :categories, only: [:index, :show]

  resources :notifications, only: :index do
    collection do
      delete 'destroy_all'
    end
  end
end

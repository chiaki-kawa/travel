Rails.application.routes.draw do
  root 'home#top'

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :post_comments, only: [:destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  
  # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  get "search" => "searches#search"

  get 'maps/index'
  resources :maps, only: [:index]

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
    get :tags, on: :collection
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :favorites 
    end
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
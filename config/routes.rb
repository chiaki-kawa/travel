Rails.application.routes.draw do
  root 'home#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    get :tags, on: :collection
  end

  resources :users, only: [:index, :show, :edit, :update]

  get "search_tag" => "posts#search_tag"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

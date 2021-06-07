Rails.application.routes.draw do
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  devise_for :users
  get '/search', to: 'searchs#search'
  resources :users, only: [:index, :show, :edit, :update] do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end

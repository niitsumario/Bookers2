Rails.application.routes.draw do
  root to: 'homes#top'
  get '/homes/about' => 'homes#about'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations', :sessions => 'users/sessions', :unlocks => 'users/unlocks'
  }
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :create, :edit, :update]
end

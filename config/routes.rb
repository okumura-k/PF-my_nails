Rails.application.routes.draw do

  root to: "homes#top"
  get "about" => 'homes#about'
  devise_for :users

  resources :nails, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :nail_comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
     collection do
      get :search
     end
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:index, :create, :show, :destroy]
    member do
      get :followings, :followers
    end
    collection do
      get :search
      get :favorites
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

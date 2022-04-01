Rails.application.routes.draw do

  get '/search', to: 'searches#search'
  root to: "homes#top"
  get "about" => 'homes#about'
  devise_for :users
  
  resources :nails, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :nail_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resources :relationships, only: [:index, :create, :show, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    # collection do
    #   get 'search'
    # end 
    member do
      get :favorites
    end 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

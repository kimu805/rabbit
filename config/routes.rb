Rails.application.routes.draw do
  root to: "tags#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :projects do
    collection do
      get "search"
    end
  end
  resources :tags, only: [:index, :show]
end

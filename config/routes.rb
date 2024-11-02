Rails.application.routes.draw do
  root to: "tags#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :projects do
    resources :habits, except: [:index, :show]
    collection do
      get "search"
    end
  end
  resources :tags, only: [:index, :show]
end

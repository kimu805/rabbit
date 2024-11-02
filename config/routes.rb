Rails.application.routes.draw do
  root to: "tags#index"
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  resources :projects, except: :index do
    resources :habits, except: :index
    collection do
      get "search"
    end
  end
  resources :tags, only: [:index, :show]
end

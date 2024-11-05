Rails.application.routes.draw do
  root to: "tags#index"
  devise_for :users
  resources :users, only: [:edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
  end
  resources :projects, except: :index do
    resources :habits, except: :index do
      resources :check_ins, only: :update
    end
    collection do
      get "search"
    end
  end
  resources :tags, only: [:index, :show]
end

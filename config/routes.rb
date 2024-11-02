Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :projects do
    collection do
      get "search"
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:index, :new, :show, :destory]
  resources :items
end

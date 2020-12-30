Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
  root to: "items#index"
  resources :items
   resources :orders, only: [:index, :create]
end
=======
  
end
>>>>>>> Stashed changes

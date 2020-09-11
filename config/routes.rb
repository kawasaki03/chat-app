Rails.application.routes.draw do
  
  devise_for :users
  resources :users,only: [:edit,:update]
root to: "messages#index"
resources :rooms,only: [:new,:create]

end

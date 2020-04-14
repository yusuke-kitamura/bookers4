Rails.application.routes.draw do
  devise_for :users

  root "top#index"
  get '/about' => "top#show"

  resources :users, only: [:index,:show,:edit,:update]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  mount ActionCable.server => '/cable'

  root to: "users#index"
end

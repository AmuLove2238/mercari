Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index, :show, :new]
end

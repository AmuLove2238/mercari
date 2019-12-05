Rails.application.routes.draw do
  root to: 'home#index'
  resources :items
  # post  'items'      =>  'items#create'
end

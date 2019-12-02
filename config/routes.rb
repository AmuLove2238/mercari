Rails.application.routes.draw do
  get 'category/index'

  root to: 'home#index'
  get 'exhibit/index'=>"exhibit#index"
  resources :items
end

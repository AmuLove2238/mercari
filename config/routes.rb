Rails.application.routes.draw do
  root to: 'home#index'
  get 'exhibit/index'=>"exhibit#index"
  resources :items
end

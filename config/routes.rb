Rails.application.routes.draw do
  get 'images/new'

  root to: 'home#index'
  resources :items do
    resources :images
  end

end

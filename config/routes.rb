Rails.application.routes.draw do
  root to: 'items#index'

  resources :items do
    resources :images
  end
  
  devise_for :users
  

  get 'exhibit/index'=>"exhibit#index"

  resources :items, only: [:index, :show]

  resources :signup, only: [:index,:create] do
    collection do
      get 'first_signup_page'   #最初の登録ページ
      post 'sms_confirmation'  #電話番号登録
      post 'address'  #送付先登録
      get 'complete_signup'  #登録完了後
    end
  end

  resources :card, only: [:new, :show, :create] do
    collection do
      post 'card',  to: 'card#new'
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :user do [:show]
    collection do
      get 'mypage'
      get 'profile'
    end
  end

end

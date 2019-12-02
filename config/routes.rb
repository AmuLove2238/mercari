Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
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
  
end

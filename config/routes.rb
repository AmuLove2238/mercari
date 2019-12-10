Rails.application.routes.draw do
  get 'purchase/index'

  get 'purchase/done'

  root to: 'items#index'

  resources :items 
  
  devise_for :users, controllers: {
  confirmations: 'users/confirmations',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  sessions:      'users/sessions',
}
  

  get 'exhibit/index'=>"exhibit#index"



  resources :signup, only: [:index, :create] do
    collection do
      get 'first_signup_page'     #最初の登録ページ
      post 'sms_confirmation'     #電話番号登録ページ
      post 'address'              #住所先登録ページ
      get 'credit_card'           #クレジットカード登録ページ
      get 'complete_signup'       #登録完了ページ
    end
  end

  resources :card, only: [:index, :new, :show, :create] do
    collection do
      post 'show', to: 'card#show'
      post 'pay_registration', to: 'card#pay_registration'
      post 'pay', to: 'card#pay'
      delete 'delete', to: 'card#delete'
    end
  end

  resources :mypage do [:index]
    collection do
      get 'information'     #本人情報 後で追加
      get 'profile'         #プロフィール
      get 'logout'          #ログアウト
    end
  end


  resources :purchase, only: [:index] do
    collection do
      get 'index'           #商品購入確認ページ
      post 'pay'            #電話番号登録ページ
      get 'done'            #購入完了ページ
    end
  end
end

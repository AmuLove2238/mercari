Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items

  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'step1'   #最初の登録ページ
      post 'step2'  #電話番号登録
      post 'step3'  #送付先登録
      post 'step4'  #入力が全て完了
      get 'complete_signup'  #登録完了後
    end
  end
  
end

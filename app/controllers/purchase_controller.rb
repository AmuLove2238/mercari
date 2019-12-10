class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:index, :pay]
  before_action :set_item, only: [:index, :pay, :done]

  
  def index
    if @card.blank? #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]#保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)#保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  
  redirect_to done_purchase_index_path(@item.id) #完了画面に移動
  end

  def done
    # @item.updete(bayer_id: current_user.id) 購入者の定義 後で使う
  end




  def set_card
    @card = current_user.card if (current_user.card).present?
  end

  def set_item
    @item = Item.find(params[:format])
  end

end

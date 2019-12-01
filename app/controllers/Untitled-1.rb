class SignupController < ApplicationController
  before_action :validates_profile, only: :sms_confirmation# step1のバリデーション
  before_action :validates_sms_confirmation, only: :address # step2のバリデーション
  before_action :validates_address, only: :credit_card # step3のバリデーション


  def profile
    @user = User.new # 新規インスタンス作成
  end

  def validates_profile #validateion用step
    session[:user_params_after_profile] = user_params #profile登録画面で入力したparamsをsessionに代入
    @user = User.new(
      session[:user_params_after_profile]) #validation用にsessionデータを変数に入力
    @user.valid?
    skip_phone_number_validate(@user.errors) #phone_numberをスキップするメソッド

    render :profile unless @user.errors.messages.blank? && @user.errors.details.blank? #validationによるエラーがあればstep1へ戻る
    
  end


  def sms_confirmation
    @user = User.new # 新規インスタンス作成
  end

  def validates_sms_confirmation
    session[:user_params_after_sms_confirmation] = user_params #sms認証で入力したparamsをsessionに代入
    session[:user_params_after_sms_confirmation].merge!(session[:user_params_after_profile]) #profileと電話番号のuser情報を結合
    @user = User.new(
      session[:user_params_after_sms_confirmation])
    render :sms_confirmation unless @user.valid?
  end


  def address
    @user = User.new # 新規インスタンス作成
    @user.build_address #userテーブルにaddressテーブルを紐付け
  end

  def validates_address
    session[:address_attributes] = user_params[:address_attributes] #addressの情報をsessionに代入
    @user = User.new(session[:address_attributes])
    render :address unless @user.valid?
  end


  def credit_card
    @user = User.new # 新規インスタンス作成
  end

  def complete
    sign_in User.find(session[:id]) unless user_signed_in? #deviseのメソッドsign_inを活用し、createアクションで作成・保存したデータのidを用いてサインイン
  end


  def create
    @user = User.new(session[:user_params_after_sms_confirmation]) #user情報をテーブルに作成
    session[:address_attributes] = user_params[:address_attributes] #addressの情報をsessionに代入
    @user.build_address(session[:address_attributes]) #address情報をテーブルに作成
    if @user.save
      session[:id] = @user.id  #　ここでidをsessionに入れることでログイン状態に持っていける。
      redirect_to complete_signup_index_path #登録完了ページに遷移
    else
      render :profile
    end
  end
  
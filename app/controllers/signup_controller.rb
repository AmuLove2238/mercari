class SignupController < ApplicationController

  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3



  def index
    
  end

  def step1 
    @user = User.new
    @user.build_personal
  end

  def save_step1_to_session
    session[:user_params] = user_params
    session[:personal_attributes_after_step1] = user_params[:personal_attributes]
    session[:personal_attributes_after_step1]

    session[:birthday] = make_birthday #birthday作成メソッドを呼び出しsesion[:birthday]に代入
    @user = User.new(session[:user_params]) #バリデーション用にインスタンス変数を作成
    @user.build_personal(session[:personal_attributes_after_step1]) #personalモデルのsession[:personal_attributes_after_step1]紐付ける
    render '/signup/step1' unless @user.valid? #バリデーションを通らなければstep1ページに留まる
  end

  def step2 # 電話番号登録
    @user = User.new
    @user.build_phonenumber
  end

  def save_step2_to_session
    session[:phonenumber_attributes_after_step2] = user_params[:phonenumber_attributes]
    @user = User.new(session[:user_params])
    @user.build_phonenumber(session[:phonenumber_attributes_after_step2])
    render :step2 unless @user.valid? #バリデーションを通らなければstep2ページに留まる
  end

  def step3 # 住所登録
    @user = User.new
    @user.build_address
  end


  # def step4 クレジット用

  #   @user = User.new
  #   @user.build_credit
  # end

  def create
    @user = User.new(session[:user_params])
    @user.build_personal(session[:birthday]) #誕生日 登録情報
    @user.build_personal(session[:personal_attributes_after_step1]) #personal 登録情報
    @user.build_phonenumber(session[:phonenumber_attributes_after_step2]) #phonenumber 登録情報
    @user.build_address(user_params[:address_attributes]) #address 登録情報
    
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_signup_index_path
    else
      render '/signup/step3'
    end
    
  end

  

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email, 
      :encrypted_password, 
      personal_attributes: [:id, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birthday],
      phonenumber_attributes: [:id, :phone_number],
      address_attributes: [:id, :address_family_name_kanji, :address_first_name_kanji, :address_family_name_kana, :address_first_name_kana, :postal_code, :region_id, :city, :district_number, :address_building,  :address_phone_number]
    )
  end

  def make_birthday # 生年月日作成

    if  # ブランクだったら何もしない
      user_params[:personal_attributes]["birthday(1i)"].empty? &&
      user_params[:personal_attributes]["birthday(2i)"].empty? &&
      user_params[:personal_attributes]["birthday(3i)"].empty?
      return
    end

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    date_year = user_params[:personal_attributes]["birthday(1i)"] 
    date_month = user_params[:personal_attributes]["birthday(2i)"]
    date_day = user_params[:personal_attributes]["birthday(3i)"]
    birthday = Date.new(date_year.to_i, date_month.to_i, date_day.to_i)
    { birthday: "#{birthday}"}
    
  end


end

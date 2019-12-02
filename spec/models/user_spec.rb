require 'rails_helper'
describe User do
  describe '#create' do

    #入力された値がnillだと"〜を入力して下さい"のエラー分が表示される
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a encrypted_password" do
      user = build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end

    #パスワードが６文字以下だと"7文字以上で入力してください"のエラー分が表示される
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, encrypted_password: "12345a")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("は7文字以上で入力してください")
    end

  end
end
require 'rails_helper'
describe Phonenumber do
  describe '#create' do

    #入力された値がnillだと"〜を入力して下さい"のエラー分が表示される
    it "is invalid without a phone_number" do
      phonenumber = build(:phonenumber, phone_number: nil)
      phonenumber.valid?
      expect(phonenumber.errors[:phone_number]).to include("を入力してください")
    end

    
  end
end
require 'rails_helper'
describe Personal do
  describe '#create' do

    #入力された値がnillだと"〜を入力して下さい"のエラー分が表示される
    it "is invalid without a family_name_kanji" do
      personal = build(:personal, family_name_kanji: nil)
      personal.valid?
      expect(personal.errors[:family_name_kanji]).to include("を入力してください")
    end

    it "is invalid without a first_name_kanji" do
      personal = build(:personal, first_name_kanji: nil)
      personal.valid?
      expect(personal.errors[:first_name_kanji]).to include("を入力してください")
    end

    it "is invalid without a family_name_kana" do
      personal = build(:personal, family_name_kana: nil)
      personal.valid?
      expect(personal.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      personal = build(:personal, first_name_kana: nil)
      personal.valid?
      expect(personal.errors[:first_name_kana]).to include("を入力してください")
    end
    
    it "is invalid without a birthday" do
      personal = build(:personal, birthday: nil)
      personal.valid?
      expect(personal.errors[:birthday]).to include("を入力してください")
    end
       


  end
end

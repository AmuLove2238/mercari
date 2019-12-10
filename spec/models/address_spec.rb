require 'rails_helper'
describe Address do
  describe '#create' do

    #入力された値がnillだと"〜を入力して下さい"のエラー分が表示される
    it "is invalid without a address_family_name_kanji" do
      address = build(:address, address_family_name_kanji: nil)
      address.valid?
      expect(address.errors[:address_family_name_kanji]).to include("を入力してください")
    end

    it "is invalid without a address_first_name_kanji" do
      address = build(:address, address_first_name_kanji: nil)
      address.valid?
      expect(address.errors[:address_first_name_kanji]).to include("を入力してください")
    end

    it "is invalid without a address_family_name_kana" do
      address = build(:address, address_family_name_kana: nil)
      address.valid?
      expect(address.errors[:address_family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a address_first_name_kana" do
      address = build(:address, address_first_name_kana: nil)
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a postal_code" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without a region_id" do
      address = build(:address, region_id: nil)
      address.valid?
      expect(address.errors[:region_id]).to include("を入力してください")
    end

    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a district_number" do
      address = build(:address, district_number: nil)
      address.valid?
      expect(address.errors[:district_number]).to include("を入力してください")
    end
       
  end
end

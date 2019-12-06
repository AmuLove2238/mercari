FactoryBot.define do

  factory :address do
    address_family_name_kanji         {"山田"}
    address_first_name_kanji          {"太郎"}
    address_family_name_kana          {"ヤマダ"}
    address_first_name_kana           {"タロウ"}
    postal_code                       {"2019-12-01"}
    region_id                         {"1"}
    city                              {"旭川"}
    district_number                   {"立花1-1-1"}
  end

end



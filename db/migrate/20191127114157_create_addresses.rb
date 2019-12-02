class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address_family_name_kanji, null: false
      t.string :address_first_name_kanji, null: false
      t.string :address_family_name_kana, null: false
      t.string :address_first_name_kana, null: false
      t.string :postal_code, null: false
      t.integer :region_id, null: false
      t.string :city, null: false
      t.string :district_number, null: false
      t.string :address_building
      t.string :address_phone_number
      t.timestamps
      
      t.references :user, foreign_key: true
    end
  end
end

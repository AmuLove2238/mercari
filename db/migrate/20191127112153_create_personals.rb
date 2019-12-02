class CreatePersonals < ActiveRecord::Migration[5.0]
  def change
    create_table :personals do |t|
      t.string :family_name_kanji, null: false
      t.string :first_name_kanji, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birthday
      t.text :icon
      t.text :introduction
      t.timestamps
      
      t.references :user, foreign_key: true
    end
  end
end

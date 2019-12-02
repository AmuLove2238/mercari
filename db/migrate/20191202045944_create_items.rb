class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      # t.references :imege_id, foreign_key: true
      t.string :name, null: false
      t.text :detail,null: false
      # t.references :category_id, null: false, foreign_key: true
      # t.references :condition_id, null:false, foreign_key: true
      # t.references :postage_id, null: false,foreign_key: true
      # t.references :region_id, null: false,foreign_key: true
      t.string :deliverdays, null: false
      t.integer :price, null: false
      t.integer :handing
      t.string :profit
      t.timestamps
    end
  end
end


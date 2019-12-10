class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :detail,null: false
      t.string :condition, null: false
      t.string :deliverdays, null: false
      t.integer :price, null: false
      t.integer :handing
      t.string :profit
      t.timestamps
    end
  end
end
class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.text :name, null: false
      # t.reference :item_id, foreign_key: true
      # t.reference :address, foreign_key: true
      t.timestamps
    end
  end
end

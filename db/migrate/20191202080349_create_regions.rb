class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.text :name, null: false
      t.references :item, foreign_key: true
      # t.references :address, foreign_key: true
      t.timestamps
    end
  end
end

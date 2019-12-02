class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :name, null: false
      # t.reference :item_id, foreign_key:true
      t.timestamps
    end
  end
end

class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.text :name, null: false
      t.references :item, foreign_key: true 
      t.timestamps
    end
  end
end


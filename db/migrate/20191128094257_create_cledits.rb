class CreateCledits < ActiveRecord::Migration[5.0]
  def change
    create_table :cledits do |t|
      t.string :name, null: false
      t.string :limit_month, null: false
      t.string :limit_year, null: false
      t.string :security, null: false
      t.timestamps
      t.references :user, foreign_key: true
      
    end
  end
end

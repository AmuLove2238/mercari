class CreatePostages < ActiveRecord::Migration[5.0]
  def change
    create_table :postages do |t|
      t.text :name, null: false
      t.references :item, foreign_key: true 
      t.timestamps
    end
  end
end

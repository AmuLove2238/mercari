class CreateSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes do |t|
      t.text :name, null: false
      # t.reference :category_id, foreign_key:true
      t.timestamps
    end
  end
end

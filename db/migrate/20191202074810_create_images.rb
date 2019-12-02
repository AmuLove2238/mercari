class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.text :images_url, null: false
      # t.reference: item_id, foreign_key: true
      t.timestamps
    end
  end
end

class AddColmnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items,:prefecture_id, :string, null: false
  end
end

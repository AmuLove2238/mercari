class AddColumnConditions < ActiveRecord::Migration[5.0]
  def change
    add_column :items,:condition,:string, null: false
  end
end

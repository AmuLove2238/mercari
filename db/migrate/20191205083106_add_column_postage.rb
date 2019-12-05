class AddColumnPostage < ActiveRecord::Migration[5.0]
  def change
    add_column :items,:postage,:string, null: false
  end
end

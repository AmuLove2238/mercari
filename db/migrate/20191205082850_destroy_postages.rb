class DestroyPostages < ActiveRecord::Migration[5.0]
  def change
    drop_table :postages
  end
end

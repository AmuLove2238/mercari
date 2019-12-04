class RenameImagesUrlColumnToImage < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :image,:image
  end
end

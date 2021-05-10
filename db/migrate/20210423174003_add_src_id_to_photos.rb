class AddSrcIdToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :src_id, :integer
  end
end

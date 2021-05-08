class RemoveCelebrationIdFromPhotos < ActiveRecord::Migration[6.1]
  def change
    remove_column :photos, :celebration_id
  end
end

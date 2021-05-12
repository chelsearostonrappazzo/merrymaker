class CreateCelebrationPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :celebration_photos do |t|
      t.integer :photo_id
      t.integer :user_id
      t.integer :celebration_id

      t.timestamps
    end
  end
end

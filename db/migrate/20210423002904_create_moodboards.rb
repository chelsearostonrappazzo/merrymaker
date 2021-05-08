class CreateMoodboards < ActiveRecord::Migration[6.1]
  def change
    create_table :moodboards do |t|
      t.integer :photo_id
      t.integer :celebration_id

      t.timestamps
    end
  end
end

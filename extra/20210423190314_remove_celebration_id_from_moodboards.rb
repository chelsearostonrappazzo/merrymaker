class RemoveCelebrationIdFromMoodboards < ActiveRecord::Migration[6.1]
  def change
    remove_column :moodboards, :celebration_id
  end
end

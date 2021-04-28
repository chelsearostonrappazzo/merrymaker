class AddCelebrationIdToMoodboards < ActiveRecord::Migration[6.1]
  def change
    add_column :moodboards, :celebration_id, :integer
  end
end

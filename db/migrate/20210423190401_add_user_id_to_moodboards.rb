class AddUserIdToMoodboards < ActiveRecord::Migration[6.1]
  def change
    add_column :moodboards, :user_id, :integer
  end
end

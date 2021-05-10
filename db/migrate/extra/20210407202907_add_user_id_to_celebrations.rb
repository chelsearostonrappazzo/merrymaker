class AddUserIdToCelebrations < ActiveRecord::Migration[6.1]
  def change
    add_column :celebrations, :user_id, :integer
  end
end

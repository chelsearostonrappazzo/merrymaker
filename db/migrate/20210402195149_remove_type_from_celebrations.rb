class RemoveTypeFromCelebrations < ActiveRecord::Migration[6.1]
  def change
    remove_column :celebrations, :type
  end
end

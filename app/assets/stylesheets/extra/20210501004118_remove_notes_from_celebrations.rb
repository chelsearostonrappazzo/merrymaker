class RemoveNotesFromCelebrations < ActiveRecord::Migration[6.1]
  def change
    remove_column :celebrations, :notes
  end
end

class AddStatusToCelebrations < ActiveRecord::Migration[6.1]
  def change
    add_column :celebrations, :status, :string, :default => "Planning"
  end
end

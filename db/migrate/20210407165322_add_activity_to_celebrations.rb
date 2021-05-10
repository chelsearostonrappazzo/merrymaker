class AddActivityToCelebrations < ActiveRecord::Migration[6.1]
  def change
    add_column :celebrations, :activity, :string
  end
end

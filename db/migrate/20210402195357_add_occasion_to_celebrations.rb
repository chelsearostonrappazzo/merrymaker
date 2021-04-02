class AddOccasionToCelebrations < ActiveRecord::Migration[6.1]
  def change
    add_column :celebrations, :occasion, :string
  end
end

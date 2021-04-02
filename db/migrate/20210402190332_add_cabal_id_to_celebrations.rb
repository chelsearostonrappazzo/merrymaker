class AddCabalIdToCelebrations < ActiveRecord::Migration[6.1]
  def change
    add_column :celebrations, :cabal_id, :integer
  end
end

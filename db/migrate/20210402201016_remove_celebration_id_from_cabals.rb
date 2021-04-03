class RemoveCelebrationIdFromCabals < ActiveRecord::Migration[6.1]
  def change
    remove_column :cabals, :celebration_id
  end
end

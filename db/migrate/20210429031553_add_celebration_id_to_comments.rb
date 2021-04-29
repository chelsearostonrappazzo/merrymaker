class AddCelebrationIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :celebration_id, :integer
  end
end

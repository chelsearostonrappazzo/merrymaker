class AddCelebrationIdToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :celebration_id, :integer
  end
end

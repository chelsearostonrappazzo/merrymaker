class RemoveCelebrationIdFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :celebration_id
  end
end

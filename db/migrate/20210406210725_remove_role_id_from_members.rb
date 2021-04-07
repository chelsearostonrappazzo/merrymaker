class RemoveRoleIdFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :role_id
  end
end
